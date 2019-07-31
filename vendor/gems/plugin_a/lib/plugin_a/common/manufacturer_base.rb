require 'rails_plugin_pattern_sample/plugin/processor'

module PluginA
  class ManufacturerBase < RailsPluginPatternSample::Plugin::Processor
    RailsPluginPatternSample::Plugin.register_processor('manufacturer_base', self, 'plugin_a/common/manufacturer_base')

    @match_metadata = {
      manufacturer: 'test'
    }
  end
end
