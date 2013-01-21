class PlayersController < ApplicationController
  def index
    world = default_world

    return render :no_game_configured unless world
  end
end
