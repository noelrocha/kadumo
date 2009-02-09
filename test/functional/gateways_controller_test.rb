require 'test_helper'

class GatewaysControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gateways)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gateway" do
    assert_difference('Gateway.count') do
      post :create, :gateway => { }
    end

    assert_redirected_to gateway_path(assigns(:gateway))
  end

  test "should show gateway" do
    get :show, :id => gateways(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => gateways(:one).id
    assert_response :success
  end

  test "should update gateway" do
    put :update, :id => gateways(:one).id, :gateway => { }
    assert_redirected_to gateway_path(assigns(:gateway))
  end

  test "should destroy gateway" do
    assert_difference('Gateway.count', -1) do
      delete :destroy, :id => gateways(:one).id
    end

    assert_redirected_to gateways_path
  end
end
