/* To add custom config, use the config object and pass values to it in the playbook. For example:
antora:
  extensions:
  - require: ./extensions/setLatestVersion.js
    add_to_navigation: true
*/

module.exports.register = function ({ config }) {
  const logger = this.getLogger('set-latest-version')
  this
    .on('contentClassified', ({ contentCatalog }) => {
      const components = contentCatalog.getComponents();
      for(let i = 0; i < components.length; i++) {
        let component = components[i];
        if(component.name === 'redpanda') {
          component.asciidoc.attributes['full-version'] = `{latest-redpanda-version}`;
        }
      }
      return components;
    })
}