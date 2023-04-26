#!/usr/bin/env bundle exec ruby

require 'kramdown-asciidoc'
require 'fileutils'
require 'execjs'
require 'rexml/document'

source_directory = './version-21.11'
output_directory = './asciidoc_docs/modules'
partials_directory = './asciidoc_docs/partials'

# Create the output and partials directories if they don't exist
FileUtils.mkdir_p(output_directory)
FileUtils.mkdir_p(partials_directory)

def process_mdx_imports(content, partials_dir)
  mdx_import_regex = /^import\s+([A-Za-z0-9]+)\s+from\s+['"](.*\.mdx)['"];/i

  content.gsub(mdx_import_regex) do |_|
    component_name = $1
    mdx_file = $2

    # Extract content from the MDX file
    mdx_content = File.read(mdx_file)

    # Convert MDX content to JSX using mdx-js
    mdx_to_jsx_code = <<-JAVASCRIPT
      const mdx = require('@mdx-js/mdx');
      const mdxContent = #{mdx_content.inspect};
      mdx.sync(mdxContent);
    JAVASCRIPT

    jsx_content = ExecJS.exec(mdx_to_jsx_code)

    # Convert JSX content to AsciiDoc
    asciidoc_partial_content = Kramdown::Document.new(jsx_content, input: :markdown).to_asciidoc

    # Save the converted partial content
    partial_file = File.join(partials_dir, "#{component_name}.adoc")
    File.write(partial_file, asciidoc_partial_content)
    puts "Created partial: #{mdx_file} -> #{partial_file}"

    # Return an AsciiDoc include directive for the partial
    "include::partials/#{component_name}.adoc[]"
  end
end

def remove_head_elements_and_extract_description(content)
  title = nil
  description = nil

  content.gsub!(/<head>(.*?)<\/head>/mi) do |head|
    head =~ /<meta\s+name="title"\s+content="(.*?)"/mi
    title = $1 if $1

    head =~ /<meta\s+name="description"\s+content="(.*?)"/mi
    description = $1 if $1
    ''
  end

  [content, title, description]
end

class CustomKramdownAsciiDocConverter < Kramdown::Converter::Asciidoc
  def convert_codeblock(el, opts)
    lang = el.attr.delete('language') || el.options[:lang]
    result = ''
    result << "[,#{lang}]\n" if lang
    result << "----\n"
    result << el.value
    result << "----\n"
    result
  end

  def convert_codespan(el, opts)
    "`#{el.value}`"
  end
end

Dir.glob("#{source_directory}/*") do |folder|
  next unless File.directory?(folder)

  module_name = File.basename(folder)
  module_pages_directory = "#{output_directory}/#{module_name}/pages"
  FileUtils.mkdir_p(module_pages_directory)

  Dir.glob("#{folder}/**/*.mdx") do |markdown_file|
  content = File.read(markdown_file)
  content_without_head, title, description = remove_head_elements_and_extract_description(content)
  content_with_partials = process_mdx_imports(content_without_head, partials_directory)

  kramdown_options = { input: :markdown, auto_id_stripping: true}
  asciidoc_content = Kramdown::Document.new(content_with_partials, kramdown_options).to_asciidoc

  asciidoc_content_with_title = "= #{title}\n"
  asciidoc_content_with_title << ":description: #{description}\n" if description
  asciidoc_content_with_title << asciidoc_content

  output_file = markdown_file.sub("#{source_directory}/#{module_name}", module_pages_directory).sub(/\.mdx$/, '.adoc')
  output_file_dir = File.dirname(output_file)

  FileUtils.mkdir_p(output_file_dir) unless Dir.exist?(output_file_dir)
  File.write(output_file, asciidoc_content_with_title)
  puts "Converted: #{markdown_file} -> #{output_file}"
  end
end