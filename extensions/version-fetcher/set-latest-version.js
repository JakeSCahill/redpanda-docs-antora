/* To add custom config, use the config object and pass values to it in the playbook. For example:
antora:
  extensions:
  - require: ./extensions/setLatestVersion.js
    add_to_navigation: true
*/

const GetLatestRedpandaVersion = require('./getLatestRedpandaVersion');

module.exports.register = function ({ config }) {
  const logger = this.getLogger('set-latest-version')
  this
    .on('contentClassified', async ({ contentCatalog }) => {
        const LatestRedpandaVersion = await GetLatestRedpandaVersion();
        const components = await contentCatalog.getComponents();
        for (let i = 0; i < components.length; i++) {
          let component = components[i];
          if (component.name === 'redpanda' && LatestRedpandaVersion.length === 2) {
            component.asciidoc.attributes['full-version'] = `${LatestRedpandaVersion[0]}`;
            component.asciidoc.attributes['latest-release-commit'] = `${LatestRedpandaVersion[1]}`;
          } else {
            logger.warn('Could not find the latest Redpanda versions - using defaults');
          }
        }
        return components;
      })
}