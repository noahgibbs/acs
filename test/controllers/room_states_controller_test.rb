require 'test_helper'

class RoomStatesControllerTest < ActionController::TestCase
  setup do
    @room_state = room_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:room_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create room_state" do
    assert_difference('RoomState.count') do
      post :create, room_state: { json_data: @room_state.json_data }
    end

    assert_redirected_to room_state_path(assigns(:room_state))
  end

  test "should show room_state" do
    get :show, id: @room_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @room_state
    assert_response :success
  end

  test "should update room_state" do
    put :update, id: @room_state, room_state: { json_data: @room_state.json_data }
    assert_redirected_to room_state_path(assigns(:room_state))
  end

  test "should destroy room_state" do
    assert_difference('RoomState.count', -1) do
      delete :destroy, id: @room_state
    end

    assert_redirected_to room_states_path
  end
end
