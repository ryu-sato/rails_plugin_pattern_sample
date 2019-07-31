require 'plugin_a/common/manufacturer_base'

module PluginA
  class ManufacturerA < ManufacturerBase
    RailsPluginPatternSample::Plugin.register_processor('manufacturer_a', self, 'plugin_a/manufacturer_a')

    @match_metadata = {
      manufacturer: 'a'
    }
  end
end
