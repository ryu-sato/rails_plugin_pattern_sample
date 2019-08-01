require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsPluginPatternSample
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # [TODO] move below config to config/environments/developments.rb
    if Rails.env.development?
      # autoload gems where are under vendor/gems directory
      plugin_gems = ['plugin_a', 'rails_plugin_pattern_sample-plugin'].map {|gem_name| Rails.root.join('vendor/gems', gem_name, 'lib').to_s }
      config.autoload_paths += plugin_gems
    end
  end
end
