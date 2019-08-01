if Rails.env.development?
  Rails.application.config.to_prepare do
    # list up all plugins
    PluginA::ManufacturerA
    PluginA::ManufacturerB
  end
end
