require 'test_helper'

class DbAliasesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:db_aliases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create db_alias" do
    assert_difference('DbAlias.count') do
      post :create, :db_alias => { }
    end

    assert_redirected_to db_alias_path(assigns(:db_alias))
  end

  test "should show db_alias" do
    get :show, :id => db_aliases(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => db_aliases(:one).id
    assert_response :success
  end

  test "should update db_alias" do
    put :update, :id => db_aliases(:one).id, :db_alias => { }
    assert_redirected_to db_alias_path(assigns(:db_alias))
  end

  test "should destroy db_alias" do
    assert_difference('DbAlias.count', -1) do
      delete :destroy, :id => db_aliases(:one).id
    end

    assert_redirected_to db_aliases_path
  end
end
