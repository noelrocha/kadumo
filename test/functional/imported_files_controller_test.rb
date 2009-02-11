require 'test_helper'

class ImportedFilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imported_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imported_file" do
    assert_difference('ImportedFile.count') do
      post :create, :imported_file => { }
    end

    assert_redirected_to imported_file_path(assigns(:imported_file))
  end

  test "should show imported_file" do
    get :show, :id => imported_files(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => imported_files(:one).id
    assert_response :success
  end

  test "should update imported_file" do
    put :update, :id => imported_files(:one).id, :imported_file => { }
    assert_redirected_to imported_file_path(assigns(:imported_file))
  end

  test "should destroy imported_file" do
    assert_difference('ImportedFile.count', -1) do
      delete :destroy, :id => imported_files(:one).id
    end

    assert_redirected_to imported_files_path
  end
end
