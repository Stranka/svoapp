require 'test_helper'

class BasketlinesControllerTest < ActionController::TestCase
  setup do
    @basketline = basketlines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basketlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basketline" do
    assert_difference('Basketline.count') do
      post :create, :basketline => @basketline.attributes
    end

    assert_redirected_to basketline_path(assigns(:basketline))
  end

  test "should show basketline" do
    get :show, :id => @basketline.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @basketline.to_param
    assert_response :success
  end

  test "should update basketline" do
    put :update, :id => @basketline.to_param, :basketline => @basketline.attributes
    assert_redirected_to basketline_path(assigns(:basketline))
  end

  test "should destroy basketline" do
    assert_difference('Basketline.count', -1) do
      delete :destroy, :id => @basketline.to_param
    end

    assert_redirected_to basketlines_path
  end
end
