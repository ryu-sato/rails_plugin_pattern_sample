require 'rails_plugin_pattern_sample/plugin/processor'

module PluginA
  module Common
    class ManufacturerBase < RailsPluginPatternSample::Plugin::Processor
      @match_metadata = {
        manufacturer: 'test'
      }
    end
  end
end
