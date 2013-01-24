require 'test_helper'

class WorldsControllerTest < ActionController::TestCase
  setup do
    @world = worlds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worlds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create world" do
    assert_difference('World.count') do
      post :create, world: { author_email: @world.author_email, author_name: @world.author_name, description: @world.description, name: @world.name }
    end

    assert_redirected_to world_path(assigns(:world))
  end

  test "should show world" do
    get :show, id: @world
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @world
    assert_response :success
  end

  test "should update world" do
    put :update, id: @world, world: { author_email: @world.author_email, author_name: @world.author_name, description: @world.description, name: @world.name }
    assert_redirected_to world_path(assigns(:world))
  end

  test "should destroy world" do
    assert_difference('World.count', -1) do
      delete :destroy, id: @world
    end

    assert_redirected_to worlds_path
  end
end
