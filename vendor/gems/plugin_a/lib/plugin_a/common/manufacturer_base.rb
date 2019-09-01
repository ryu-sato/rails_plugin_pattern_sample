require 'rails_plugin_pattern_sample_plugin'

module PluginA
  module Common
    class ManufacturerBase < RailsPluginPatternSamplePlugin::Processor
      @match_metadata = {
        manufacturer: 'test'
      }
    end
  end
end
