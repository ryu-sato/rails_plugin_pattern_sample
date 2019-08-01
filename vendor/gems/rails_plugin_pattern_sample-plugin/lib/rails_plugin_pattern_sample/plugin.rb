require "rails_plugin_pattern_sample/plugin/version"

require 'active_support/dependencies'

module RailsPluginPatternSample
  autoload :Error, 'rails_plugin_pattern_sample/error'
  autoload :ProcessorSelectionFailed, 'rails_plugin_pattern_sample/error'

  module Plugin
    autoload :Processor, 'rails_plugin_pattern_sample/plugin/processor'
    autoload :Register, 'rails_plugin_pattern_sample/plugin/register'
    autoload :Core, 'rails_plugin_pattern_sample/plugin/core'
  end
end
