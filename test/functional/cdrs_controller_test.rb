require 'test_helper'

class CdrsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cdrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cdr" do
    assert_difference('Cdr.count') do
      post :create, :cdr => { }
    end

    assert_redirected_to cdr_path(assigns(:cdr))
  end

  test "should show cdr" do
    get :show, :id => cdrs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cdrs(:one).id
    assert_response :success
  end

  test "should update cdr" do
    put :update, :id => cdrs(:one).id, :cdr => { }
    assert_redirected_to cdr_path(assigns(:cdr))
  end

  test "should destroy cdr" do
    assert_difference('Cdr.count', -1) do
      delete :destroy, :id => cdrs(:one).id
    end

    assert_redirected_to cdrs_path
  end
end
