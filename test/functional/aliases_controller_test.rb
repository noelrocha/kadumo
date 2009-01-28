require 'test_helper'

class AliasesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aliases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alias" do
    assert_difference('Alias.count') do
      post :create, :alias => { }
    end

    assert_redirected_to alias_path(assigns(:alias))
  end

  test "should show alias" do
    get :show, :id => aliases(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => aliases(:one).id
    assert_response :success
  end

  test "should update alias" do
    put :update, :id => aliases(:one).id, :alias => { }
    assert_redirected_to alias_path(assigns(:alias))
  end

  test "should destroy alias" do
    assert_difference('Alias.count', -1) do
      delete :destroy, :id => aliases(:one).id
    end

    assert_redirected_to aliases_path
  end
end
