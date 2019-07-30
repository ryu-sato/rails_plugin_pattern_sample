require 'rails_plugin_pattern_sample/plugin/processor'

module PluginA
  class ManufacturerBase < RailsPluginPatternSample::Plugin::Processor
    RailsPluginPatternSample::Plugin.register_processor('manufacturer_base', self)

    @match_metadata = {
      manufacturer: 'Base'
    }
  end
end
