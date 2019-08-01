class StaticPagesController < ApplicationController
  def main
    @plugin_manufacturer_a = RailsPluginPatternSample::Plugin::Core.get_processor(manufacturer: 'a')
    @plugins = RailsPluginPatternSample::Plugin::Core.all_processors
  end
end
