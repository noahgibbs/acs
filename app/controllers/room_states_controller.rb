class RoomStatesController < ApplicationController
  before_filter authenticate_user!
  before_filter implementors_only!

  # GET /room_states
  # GET /room_states.json
  def index
    @room_states = RoomState.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @room_states }
    end
  end

  # GET /room_states/1
  # GET /room_states/1.json
  def show
    @room_state = RoomState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @room_state }
    end
  end

  # GET /room_states/new
  # GET /room_states/new.json
  def new
    @room_state = RoomState.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @room_state }
    end
  end

  # GET /room_states/1/edit
  def edit
    @room_state = RoomState.find(params[:id])
  end

  # POST /room_states
  # POST /room_states.json
  def create
    @room_state = RoomState.new(params[:room_state])

    respond_to do |format|
      if @room_state.save
        format.html { redirect_to @room_state, notice: 'Room state was successfully created.' }
        format.json { render json: @room_state, status: :created, location: @room_state }
      else
        format.html { render action: "new" }
        format.json { render json: @room_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /room_states/1
  # PUT /room_states/1.json
  def update
    @room_state = RoomState.find(params[:id])

    respond_to do |format|
      if @room_state.update_attributes(params[:room_state])
        format.html { redirect_to @room_state, notice: 'Room state was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @room_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_states/1
  # DELETE /room_states/1.json
  def destroy
    @room_state = RoomState.find(params[:id])
    @room_state.destroy

    respond_to do |format|
      format.html { redirect_to room_states_url }
      format.json { head :no_content }
    end
  end
end
