require 'plugin_a/common/manufacturer_base'

module PluginA
  class ManufacturerB < Common::ManufacturerBase
    RailsPluginPatternSample::Plugin::Core.register_processor('manufacturer_b', self, 'plugin_a/manufacturer_b')

    @match_metadata = {
      manufacturer: 'b'
    }
  end
end
