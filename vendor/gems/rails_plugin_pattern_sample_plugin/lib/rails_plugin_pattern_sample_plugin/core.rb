require_relative '../error'
require_relative 'register'

module RailsPluginPatternSamplePlugin
  class Core
    PROCESSOR_PLUGINS = Register.new('processor')

    def self.register_processor(type, klass, require_file)
      register_impl('processor', PROCESSOR_PLUGINS, type, klass, require_file)
    end

    def self.register_impl(kind, registry, type, value, require_file)
      if !value.is_a?(Class) && !value.respond_to?(:match_metadata)
        raise Fluent::ConfigError, "Invalid implementation as #{kind} plugin: '#{type}'. It must be a Class, or callable."
      end
      registry.register(value, require_file)
      logger.info "registered #{kind} plugin '#{type}'" if defined?(logger)
      nil
    end

    def self.get_processor(params)
      matched_procs = get_plugins(PROCESSOR_PLUGINS, params)
      raise ::ProcessorSelectionFailed, found_processors: matched_procs if matched_procs.size != 1
      matched_procs.first
    end

    def self.all_processors
      all_plugins(PROCESSOR_PLUGINS)
    end

    def self.get_plugins(registry, params)
      registry.lookup(params)
    end

    def self.all_plugins(registry)
      registry.plugins
    end
  end
end
