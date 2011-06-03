require 'test_helper'

class ProductclassesControllerTest < ActionController::TestCase
  setup do
    @productclass = productclasses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productclasses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create productclass" do
    assert_difference('Productclass.count') do
      post :create, :productclass => @productclass.attributes
    end

    assert_redirected_to productclass_path(assigns(:productclass))
  end

  test "should show productclass" do
    get :show, :id => @productclass.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @productclass.to_param
    assert_response :success
  end

  test "should update productclass" do
    put :update, :id => @productclass.to_param, :productclass => @productclass.attributes
    assert_redirected_to productclass_path(assigns(:productclass))
  end

  test "should destroy productclass" do
    assert_difference('Productclass.count', -1) do
      delete :destroy, :id => @productclass.to_param
    end

    assert_redirected_to productclasses_path
  end
end
