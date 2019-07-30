require "rails_plugin_pattern_sample/plugin/version"

module RailsPluginPatternSample
  module Plugin
    class Error < StandardError; end
    # Your code goes here...

    RULE_PLUGINS = []

    def self.register_rule(type, klass)
      register_impl('rule', RULE_PLUGINS, type, klass)
    end

    def self.register_impl(kind, registry, type, value)
      if !value.is_a?(Class) && !value.respond_to?(:match_metadata)
        raise Fluent::ConfigError, "Invalid implementation as #{kind} plugin: '#{type}'. It must be a Class, or callable."
      end
      registry << value
      logger.info "registered #{kind} plugin '#{type}'" if defined?(logger)
      nil
    end
  end
end
