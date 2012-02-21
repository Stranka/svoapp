require 'test_helper'

class BillingaddressesControllerTest < ActionController::TestCase
  setup do
    @billingaddress = billingaddresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:billingaddresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create billingaddress" do
    assert_difference('Billingaddress.count') do
      post :create, :billingaddress => @billingaddress.attributes
    end

    assert_redirected_to billingaddress_path(assigns(:billingaddress))
  end

  test "should show billingaddress" do
    get :show, :id => @billingaddress.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @billingaddress.to_param
    assert_response :success
  end

  test "should update billingaddress" do
    put :update, :id => @billingaddress.to_param, :billingaddress => @billingaddress.attributes
    assert_redirected_to billingaddress_path(assigns(:billingaddress))
  end

  test "should destroy billingaddress" do
    assert_difference('Billingaddress.count', -1) do
      delete :destroy, :id => @billingaddress.to_param
    end

    assert_redirected_to billingaddresses_path
  end
end
