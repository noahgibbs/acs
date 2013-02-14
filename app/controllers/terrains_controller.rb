class TerrainsController < ApplicationController
  def classify
    @images = GameImage.all
    @terrain_set = TerrainSet.where(:name => :default).first_or_create
    until @terrain_set.terrains.count >= 30
      @terrain_set.terrains.create
    end
  end

  def terrain_set
    STDERR.puts "POSTED: #{params.inspect}"
    redirect_to :action => :show
  end

  def show
    @terrain_set = TerrainSet.where(:name => :default).first_or_create
  end
end
