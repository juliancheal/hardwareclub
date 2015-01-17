require 'test_helper'

class WatchlatersControllerTest < ActionController::TestCase
  setup do
    @watchlater = watchlaters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:watchlaters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create watchlater" do
    assert_difference('Watchlater.count') do
      post :create, watchlater: {  }
    end

    assert_redirected_to watchlater_path(assigns(:watchlater))
  end

  test "should show watchlater" do
    get :show, id: @watchlater
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @watchlater
    assert_response :success
  end

  test "should update watchlater" do
    patch :update, id: @watchlater, watchlater: {  }
    assert_redirected_to watchlater_path(assigns(:watchlater))
  end

  test "should destroy watchlater" do
    assert_difference('Watchlater.count', -1) do
      delete :destroy, id: @watchlater
    end

    assert_redirected_to watchlaters_path
  end
end
