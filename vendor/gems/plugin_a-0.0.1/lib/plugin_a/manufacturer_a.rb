require 'plugin_a/common/manufacturer_base'

module PluginA
  class ManufacturerA < ManufacturerBase
    RailsPluginPatternSample::Plugin.register_rule('manufacturer_a', self)

    MATCH_METADATA = {
      manufacturer: 'a'
    }

    def match_metadata
      MATCH_METADATA
    end
  end
end
