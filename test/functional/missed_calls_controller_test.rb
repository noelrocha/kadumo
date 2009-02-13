require 'test_helper'

class MissedCallsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:missed_calls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create missed_call" do
    assert_difference('MissedCall.count') do
      post :create, :missed_call => { }
    end

    assert_redirected_to missed_call_path(assigns(:missed_call))
  end

  test "should show missed_call" do
    get :show, :id => missed_calls(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => missed_calls(:one).id
    assert_response :success
  end

  test "should update missed_call" do
    put :update, :id => missed_calls(:one).id, :missed_call => { }
    assert_redirected_to missed_call_path(assigns(:missed_call))
  end

  test "should destroy missed_call" do
    assert_difference('MissedCall.count', -1) do
      delete :destroy, :id => missed_calls(:one).id
    end

    assert_redirected_to missed_calls_path
  end
end
