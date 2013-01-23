class PlayersController < ApplicationController
  def index
    @world = default_world
    return render :no_game_configured unless @world

    # Get current server status
    @status = ServerStatus.where(:world_id => @world.id).first

    return render :no_server_running unless @status && (Time.now - @status.updated_at) <= 60.seconds

    return render :not_logged_in unless current_user


  end
end
