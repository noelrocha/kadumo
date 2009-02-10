require 'test_helper'

class DialogsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dialogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dialog" do
    assert_difference('Dialog.count') do
      post :create, :dialog => { }
    end

    assert_redirected_to dialog_path(assigns(:dialog))
  end

  test "should show dialog" do
    get :show, :id => dialogs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dialogs(:one).id
    assert_response :success
  end

  test "should update dialog" do
    put :update, :id => dialogs(:one).id, :dialog => { }
    assert_redirected_to dialog_path(assigns(:dialog))
  end

  test "should destroy dialog" do
    assert_difference('Dialog.count', -1) do
      delete :destroy, :id => dialogs(:one).id
    end

    assert_redirected_to dialogs_path
  end
end
