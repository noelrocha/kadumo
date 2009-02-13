require 'test_helper'

class AccsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acc" do
    assert_difference('Acc.count') do
      post :create, :acc => { }
    end

    assert_redirected_to acc_path(assigns(:acc))
  end

  test "should show acc" do
    get :show, :id => accs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => accs(:one).id
    assert_response :success
  end

  test "should update acc" do
    put :update, :id => accs(:one).id, :acc => { }
    assert_redirected_to acc_path(assigns(:acc))
  end

  test "should destroy acc" do
    assert_difference('Acc.count', -1) do
      delete :destroy, :id => accs(:one).id
    end

    assert_redirected_to accs_path
  end
end
