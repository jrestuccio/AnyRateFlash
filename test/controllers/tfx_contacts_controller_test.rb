require 'test_helper'

class TfxContactsControllerTest < ActionController::TestCase
  setup do
    @tfx_contact = tfx_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tfx_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tfx_contact" do
    assert_difference('TfxContact.count') do
      post :create, tfx_contact: { ContactID: @tfx_contact.ContactID, EMail: @tfx_contact.EMail, Expires: @tfx_contact.Expires, Ext: @tfx_contact.Ext, FirstName: @tfx_contact.FirstName, LastName: @tfx_contact.LastName, Password: @tfx_contact.Password, Phone: @tfx_contact.Phone, UserID: @tfx_contact.UserID }
    end

    assert_redirected_to tfx_contact_path(assigns(:tfx_contact))
  end

  test "should show tfx_contact" do
    get :show, id: @tfx_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tfx_contact
    assert_response :success
  end

  test "should update tfx_contact" do
    patch :update, id: @tfx_contact, tfx_contact: { ContactID: @tfx_contact.ContactID, EMail: @tfx_contact.EMail, Expires: @tfx_contact.Expires, Ext: @tfx_contact.Ext, FirstName: @tfx_contact.FirstName, LastName: @tfx_contact.LastName, Password: @tfx_contact.Password, Phone: @tfx_contact.Phone, UserID: @tfx_contact.UserID }
    assert_redirected_to tfx_contact_path(assigns(:tfx_contact))
  end

  test "should destroy tfx_contact" do
    assert_difference('TfxContact.count', -1) do
      delete :destroy, id: @tfx_contact
    end

    assert_redirected_to tfx_contacts_path
  end
end
