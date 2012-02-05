require 'test_helper'

class MenuesControllerTest < ActionController::TestCase
  setup do
    @menue = menues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menue" do
    assert_difference('Menue.count') do
      post :create, :menue => @menue.attributes
    end

    assert_redirected_to menue_path(assigns(:menue))
  end

  test "should show menue" do
    get :show, :id => @menue.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @menue.to_param
    assert_response :success
  end

  test "should update menue" do
    put :update, :id => @menue.to_param, :menue => @menue.attributes
    assert_redirected_to menue_path(assigns(:menue))
  end

  test "should destroy menue" do
    assert_difference('Menue.count', -1) do
      delete :destroy, :id => @menue.to_param
    end

    assert_redirected_to menues_path
  end
end
