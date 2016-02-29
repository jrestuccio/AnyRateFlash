class ForeignKeys < ActiveRecord::Migration
  def change

  add_foreign_key "tfx_CustomerShoppingHotels", "tfx_Customers", column: "CustomerID", primary_key: "CustomerID", name: "FK_cusID"
  add_foreign_key "tfx_CustomerShoppingHotels", "tfx_Hotels", column: "HotelID", primary_key: "HotelID", name: "FK_tfx_CustomerShoppingHotels_tfx_Hotels"
  add_foreign_key "tfx_CustomerShoppingSites", "tfx_Customers", column: "CustomerID", primary_key: "CustomerID", name: "FK_tfx_CustomerShoppingSites_tfx_Customers"
  add_foreign_key "tfx_CustomerShoppingSites", "tfx_Sites", column: "SiteID", primary_key: "SiteID", name: "FK_tfx_CustomerShoppingSites_tfx_Sites"
  add_foreign_key "tfx_Hotels", "tfx_HotelChains", column: "HotelChainID", primary_key: "HotelChainID", name: "FK_tfx_Hotels_tfx_HotelChains"
  add_foreign_key "tfx_SiteParameters", "tfx_Hotels", column: "HotelID", primary_key: "HotelID", name: "FK_tfx_SiteParameters_tfx_Hotels"
  add_foreign_key "tfx_SiteParameters", "tfx_SiteParameterRoles", column: "ParameterRoleID", primary_key: "SiteParameterRoleID", name: "FK_tfx_SiteParameters_tfx_SiteParameterRoles"
  add_foreign_key "tfx_SiteParameters", "tfx_Sites", column: "SiteID", primary_key: "SiteID", name: "FK_tfx_SiteParameters_tfx_Sites"

  end
end
