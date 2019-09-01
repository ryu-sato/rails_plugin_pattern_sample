class StaticPagesController < ApplicationController
  def main
    @plugin_manufacturer_a = RailsPluginPatternSamplePlugin::Core.get_processor(manufacturer: 'a')
    @plugins = RailsPluginPatternSamplePlugin::Core.all_processors
  end
end
