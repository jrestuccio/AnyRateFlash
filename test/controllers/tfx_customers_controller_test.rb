require 'test_helper'

class TfxCustomersControllerTest < ActionController::TestCase
  setup do
    @tfx_customer = tfx_customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tfx_customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tfx_customer" do
    assert_difference('TfxCustomer.count') do
      post :create, tfx_customer: { Address1: @tfx_customer.Address1, Address2: @tfx_customer.Address2, C_CustomerID: @tfx_customer.C_CustomerID, City: @tfx_customer.City, CountryCode: @tfx_customer.CountryCode, CustoemrID: @tfx_customer.CustoemrID, CustomerChainID: @tfx_customer.CustomerChainID, CustomerName: @tfx_customer.CustomerName, CustomerSiteID: @tfx_customer.CustomerSiteID, HostHotelID: @tfx_customer.HostHotelID, LoginCode: @tfx_customer.LoginCode, Phone: @tfx_customer.Phone, State: @tfx_customer.State, Zip: @tfx_customer.Zip }
    end

    assert_redirected_to tfx_customer_path(assigns(:tfx_customer))
  end

  test "should show tfx_customer" do
    get :show, id: @tfx_customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tfx_customer
    assert_response :success
  end

  test "should update tfx_customer" do
    patch :update, id: @tfx_customer, tfx_customer: { Address1: @tfx_customer.Address1, Address2: @tfx_customer.Address2, C_CustomerID: @tfx_customer.C_CustomerID, City: @tfx_customer.City, CountryCode: @tfx_customer.CountryCode, CustoemrID: @tfx_customer.CustoemrID, CustomerChainID: @tfx_customer.CustomerChainID, CustomerName: @tfx_customer.CustomerName, CustomerSiteID: @tfx_customer.CustomerSiteID, HostHotelID: @tfx_customer.HostHotelID, LoginCode: @tfx_customer.LoginCode, Phone: @tfx_customer.Phone, State: @tfx_customer.State, Zip: @tfx_customer.Zip }
    assert_redirected_to tfx_customer_path(assigns(:tfx_customer))
  end

  test "should destroy tfx_customer" do
    assert_difference('TfxCustomer.count', -1) do
      delete :destroy, id: @tfx_customer
    end

    assert_redirected_to tfx_customers_path
  end
end
