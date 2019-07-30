require 'plugin_a/common/manufacturer_base'

module PluginA
  class ManufacturerA < ManufacturerBase
    RailsPluginPatternSample::Plugin.register_processor('manufacturer_a', self)

    @match_metadata = {
      manufacturer: 'a'
    }
  end
end
