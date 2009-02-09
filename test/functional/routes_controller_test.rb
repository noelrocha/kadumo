require 'test_helper'

class RoutesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create route" do
    assert_difference('Route.count') do
      post :create, :route => { }
    end

    assert_redirected_to route_path(assigns(:route))
  end

  test "should show route" do
    get :show, :id => routes(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => routes(:one).id
    assert_response :success
  end

  test "should update route" do
    put :update, :id => routes(:one).id, :route => { }
    assert_redirected_to route_path(assigns(:route))
  end

  test "should destroy route" do
    assert_difference('Route.count', -1) do
      delete :destroy, :id => routes(:one).id
    end

    assert_redirected_to routes_path
  end
end
