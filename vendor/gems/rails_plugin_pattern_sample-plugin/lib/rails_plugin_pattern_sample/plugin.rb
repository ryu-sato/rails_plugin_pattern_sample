require "rails_plugin_pattern_sample/plugin/version"
require 'rails_plugin_pattern_sample/error'

module RailsPluginPatternSample
  module Plugin
    class Error < StandardError; end
    # Your code goes here...

    PROCESSOR_PLUGINS = []

    def self.register_processor(type, klass)
      register_impl('processor', PROCESSOR_PLUGINS, type, klass)
    end

    def self.register_impl(kind, registry, type, value)
      if !value.is_a?(Class) && !value.respond_to?(:match_metadata)
        raise Fluent::ConfigError, "Invalid implementation as #{kind} plugin: '#{type}'. It must be a Class, or callable."
      end
      registry << value
      logger.info "registered #{kind} plugin '#{type}'" if defined?(logger)
      nil
    end

    def self.get_processor(params)
      matched_procs = PROCESSOR_PLUGINS.select { |proc| processor_match_params?(proc, params) }
      raise RailsPluginPatternSample::ProcessorSelectionFailed, found_processors: matched_procs if matched_procs.size != 1

      matched_procs.first
    end
    
    def self.all_processors
      PROCESSOR_PLUGINS
    end

    private

    def self.processor_match_params?(processor, params)
      processor&.match_metadata&.keys&.sort == params&.keys&.sort &&
        params&.all? { |p| p[1].match(processor.match_metadata[p[0]]) }
    end
  end
end
