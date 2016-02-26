require 'test_helper'

class TfxCorporateCustomersControllerTest < ActionController::TestCase
  setup do
    @tfx_corporate_customer = tfx_corporate_customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tfx_corporate_customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tfx_corporate_customer" do
    assert_difference('TfxCorporateCustomer.count') do
      post :create, tfx_corporate_customer: { Address1: @tfx_corporate_customer.Address1, Address2: @tfx_corporate_customer.Address2, C_CustomerChainID: @tfx_corporate_customer.C_CustomerChainID, C_CustomerID: @tfx_corporate_customer.C_CustomerID, C_CustomerName: @tfx_corporate_customer.C_CustomerName, C_LoginCode: @tfx_corporate_customer.C_LoginCode, City: @tfx_corporate_customer.City, Phone: @tfx_corporate_customer.Phone, State: @tfx_corporate_customer.State, Zip: @tfx_corporate_customer.Zip }
    end

    assert_redirected_to tfx_corporate_customer_path(assigns(:tfx_corporate_customer))
  end

  test "should show tfx_corporate_customer" do
    get :show, id: @tfx_corporate_customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tfx_corporate_customer
    assert_response :success
  end

  test "should update tfx_corporate_customer" do
    patch :update, id: @tfx_corporate_customer, tfx_corporate_customer: { Address1: @tfx_corporate_customer.Address1, Address2: @tfx_corporate_customer.Address2, C_CustomerChainID: @tfx_corporate_customer.C_CustomerChainID, C_CustomerID: @tfx_corporate_customer.C_CustomerID, C_CustomerName: @tfx_corporate_customer.C_CustomerName, C_LoginCode: @tfx_corporate_customer.C_LoginCode, City: @tfx_corporate_customer.City, Phone: @tfx_corporate_customer.Phone, State: @tfx_corporate_customer.State, Zip: @tfx_corporate_customer.Zip }
    assert_redirected_to tfx_corporate_customer_path(assigns(:tfx_corporate_customer))
  end

  test "should destroy tfx_corporate_customer" do
    assert_difference('TfxCorporateCustomer.count', -1) do
      delete :destroy, id: @tfx_corporate_customer
    end

    assert_redirected_to tfx_corporate_customers_path
  end
end
