class ForeignKeys < ActiveRecord::Migration
  def change


  execute "ALTER TABLE tfx_v2_errorcodes CHANGE COLUMN ErrorCodeID ErrorCodeID INT(11) NOT NULL AUTO_INCREMENT , ADD PRIMARY KEY (ErrorCodeID);"
  execute "ALTER TABLE tfx_sites CHANGE COLUMN SiteID SiteID INT(11) NOT NULL AUTO_INCREMENT , ADD PRIMARY KEY (SiteID);"
  execute "ALTER TABLE tfx_v2_ratetypes CHANGE COLUMN RateTypeID RateTypeID INT(11) NOT NULL AUTO_INCREMENT , ADD PRIMARY KEY (RateTypeID);"




  add_foreign_key "tfx_customershoppinghotels", "tfx_customers", column: "CustomerID", primary_key: "CustomerID", name: "FK_cusID"
  add_foreign_key "tfx_customershoppinghotels", "tfx_hotels", column: "HotelID", primary_key: "HotelID", name: "FK_tfx_CustomerShoppingHotels_tfx_Hotels"
  add_foreign_key "tfx_customershoppingsites", "tfx_customers", column: "CustomerID", primary_key: "CustomerID", name: "FK_tfx_CustomerShoppingSites_tfx_Customers"
  add_foreign_key "tfx_customershoppingsites", "tfx_sites", column: "SiteID", primary_key: "SiteID", name: "FK_tfx_CustomerShoppingSites_tfx_Sites"
  add_foreign_key "tfx_hotels", "tfx_hotelchains", column: "HotelChainID", primary_key: "HotelChainID", name: "FK_tfx_Hotels_tfx_HotelChains"
  add_foreign_key "tfx_siteparameters", "tfx_hotels", column: "HotelID", primary_key: "HotelID", name: "FK_tfx_SiteParameters_tfx_Hotels"
  add_foreign_key "tfx_siteparameters", "tfx_siteparameterroles", column: "ParameterRoleID", primary_key: "SiteParameterRoleID", name: "FK_tfx_SiteParameters_tfx_SiteParameterRoles"
  add_foreign_key "tfx_siteparameters", "tfx_sites", column: "SiteID", primary_key: "SiteID", name: "FK_tfx_SiteParameters_tfx_Sites"



  end
end
