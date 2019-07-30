require 'rails_plugin_pattern_sample/plugin'

module PluginA
  class ManufacturerBase
    RailsPluginPatternSample::Plugin.register_rule('manufacturer_base', self)

    MATCH_METADATA = {
      manufacturer: 'Base'
    }

    def match_metadata
      MATCH_METADATA
    end
  end
end
