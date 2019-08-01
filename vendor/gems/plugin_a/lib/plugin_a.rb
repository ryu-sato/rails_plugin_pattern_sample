require "plugin_a/version"

require 'active_support/dependencies'

module PluginA
  autoload :Error, 'plugin_a/error'
  autoload :ManufacturerA, 'plugin_a/manufacturer_a'

  module Common
    autoload :ManufacturerBase, 'plugin_a/common/manufacturer_base'
  end
end
