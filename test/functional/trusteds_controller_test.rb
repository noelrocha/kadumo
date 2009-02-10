require 'test_helper'

class TrustedsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trusteds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trusted" do
    assert_difference('Trusted.count') do
      post :create, :trusted => { }
    end

    assert_redirected_to trusted_path(assigns(:trusted))
  end

  test "should show trusted" do
    get :show, :id => trusteds(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => trusteds(:one).id
    assert_response :success
  end

  test "should update trusted" do
    put :update, :id => trusteds(:one).id, :trusted => { }
    assert_redirected_to trusted_path(assigns(:trusted))
  end

  test "should destroy trusted" do
    assert_difference('Trusted.count', -1) do
      delete :destroy, :id => trusteds(:one).id
    end

    assert_redirected_to trusteds_path
  end
end
