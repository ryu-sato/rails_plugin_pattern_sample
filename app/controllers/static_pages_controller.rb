class StaticPagesController < ApplicationController
  def main
    @plugin_manufacturer_a = RailsPluginPatternSample::Plugin.get_processor(manufacturer: 'a')
    @plugins = RailsPluginPatternSample::Plugin.all_processors
  end
end
