class TerrainsController < ApplicationController
  def classify
    @images = GameImage.all
    @terrain_set = TerrainSet.where(:name => :default).first_or_create
    until @terrain_set.terrains.count >= 30
      @terrain_set.terrains.build
    end
  end

  def terrain_set
    STDERR.puts "POSTED: #{params.inspect}"

    @terrain_set = TerrainSet.where(:name => :default).first
    pt = params[:terrain_set].permit :terrains_attributes => [ :name, :game_image_id, :passibility, :id ]
    @terrain_set.update_attributes(pt)

    redirect_to :action => :show
  end

  def show
    @terrain_set = TerrainSet.where(:name => :default).first_or_create
  end
end
