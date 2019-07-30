class StaticPagesController < ApplicationController
  def main
    @plugins = [PluginA::ManufacturerA.new]
  end
end
