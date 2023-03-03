require 'kramdown-asciidoc'

Dir.glob('docs/modules/get-started/*.mdx') do | filename|
  puts "working on: #{filename}..."
    Kramdoc.convert_file filename
end