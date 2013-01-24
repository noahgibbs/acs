class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authors_only!

  before_filter :implementors_only!, :except => :index

  def index
    @world = default_world
    @active_world_last_update = (@world && @world.server_status) ? @world.server_status.updated_at : nil
    db_worlds = World.all
    world_ids = db_worlds.map(&:id)

    # Get current server status
    @statuses = ServerStatus.all

    # Destroy outdated statuses, if any
    requery = false
    @statuses.each do |status|
      # Any statuses for deleted worlds?  Get rid of them.
      unless world_ids.include?(status.world_id)
        STDERR.puts "*** Deleting outdated status for world #{status.world_id}"
        status.destroy
        requery = true
      end
    end

    # Query again after destroy, if any
    @statuses = ServerStatus.all if requery
  end

  def start_server
    STDERR.puts "*** Starting server from Rails"
    system("./bin/rails runner game_server.rb #{default_world.id} &")

    unless $?.success?
      STDERR.puts "-> Failed starting server: #{$?.inspect}"
    end

    redirect_to :action => :index
  end

  def users
    @users = User.all
  end
end
