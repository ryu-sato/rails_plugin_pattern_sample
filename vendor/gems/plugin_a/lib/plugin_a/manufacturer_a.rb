require 'plugin_a/common/manufacturer_base'

module PluginA
  class ManufacturerA < Common::ManufacturerBase
    RailsPluginPatternSample::Plugin::Core.register_processor('manufacturer_a', self, 'plugin_a/manufacturer_a')

    @match_metadata = {
      manufacturer: 'a'
    }
  end
end
