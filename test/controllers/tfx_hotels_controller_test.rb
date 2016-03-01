require 'test_helper'

class TfxHotelsControllerTest < ActionController::TestCase
  setup do
    @tfx_hotel = tfx_hotels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tfx_hotels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tfx_hotel" do
    assert_difference('TfxHotel.count') do
      post :create, tfx_hotel: { Address2: @tfx_hotel.Address2, Address: @tfx_hotel.Address, City: @tfx_hotel.City, Country: @tfx_hotel.Country, DateCreated: @tfx_hotel.DateCreated, HotelChainID: @tfx_hotel.HotelChainID, HotelID: @tfx_hotel.HotelID, Name: @tfx_hotel.Name, Phone: @tfx_hotel.Phone, ShortName: @tfx_hotel.ShortName, SiteID: @tfx_hotel.SiteID, State: @tfx_hotel.State, Zip: @tfx_hotel.Zip }
    end

    assert_redirected_to tfx_hotel_path(assigns(:tfx_hotel))
  end

  test "should show tfx_hotel" do
    get :show, id: @tfx_hotel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tfx_hotel
    assert_response :success
  end

  test "should update tfx_hotel" do
    patch :update, id: @tfx_hotel, tfx_hotel: { Address2: @tfx_hotel.Address2, Address: @tfx_hotel.Address, City: @tfx_hotel.City, Country: @tfx_hotel.Country, DateCreated: @tfx_hotel.DateCreated, HotelChainID: @tfx_hotel.HotelChainID, HotelID: @tfx_hotel.HotelID, Name: @tfx_hotel.Name, Phone: @tfx_hotel.Phone, ShortName: @tfx_hotel.ShortName, SiteID: @tfx_hotel.SiteID, State: @tfx_hotel.State, Zip: @tfx_hotel.Zip }
    assert_redirected_to tfx_hotel_path(assigns(:tfx_hotel))
  end

  test "should destroy tfx_hotel" do
    assert_difference('TfxHotel.count', -1) do
      delete :destroy, id: @tfx_hotel
    end

    assert_redirected_to tfx_hotels_path
  end
end
