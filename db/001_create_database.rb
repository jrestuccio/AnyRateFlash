# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

class CreateDatabase < ActiveRecord::Migration
    def self.up      

ActiveRecord::Schema.define(version: 20160302042127) do

  create_table "tfx_contacts", primary_key: "ContactID", force: :cascade do |t|
    t.string   "FirstName", limit: 100, null: false
    t.string   "LastName",  limit: 100, null: false
    t.string   "EMail",     limit: 100, null: false
    t.string   "UserID",    limit: 100, null: false
    t.string   "Password",  limit: 20,  null: false
    t.string   "Phone",     limit: 30
    t.string   "Ext",       limit: 10
    t.datetime "Expires",               null: false
  end

  create_table "tfx_corporatecustomers", primary_key: "C_CustomerID", force: :cascade do |t|
    t.string  "C_LoginCode",       limit: 15
    t.integer "C_CustomerChainID", limit: 4
    t.string  "C_CustomerName",    limit: 300
    t.string  "Address1",          limit: 300
    t.string  "Address2",          limit: 300
    t.string  "City",              limit: 100
    t.string  "State",             limit: 2
    t.string  "Zip",               limit: 10
    t.string  "Phone",             limit: 30
  end

  add_index "tfx_corporatecustomers", ["C_CustomerID"], name: "cus_id", using: :btree

  create_table "tfx_customershoppinghotels", id: false, force: :cascade do |t|
    t.integer "CustomerID", limit: 4, null: false
    t.integer "HotelID",    limit: 4, null: false
  end

  add_index "tfx_customershoppinghotels", ["CustomerID"], name: "CustomerID", using: :btree
  add_index "tfx_customershoppinghotels", ["HotelID"], name: "HotelID", using: :btree

  create_table "tfx_customershoppingsites", id: false, force: :cascade do |t|
    t.integer "CustomerID", limit: 4, null: false
    t.integer "SiteID",     limit: 4, null: false
  end

  add_index "tfx_customershoppingsites", ["SiteID"], name: "FK_tfx_CustomerShoppingSites_tfx_Sites", using: :btree

  create_table "tfx_customers", primary_key: "CustomerID", force: :cascade do |t|
    t.string  "LoginCode",       limit: 15
    t.integer "CustomerChainID", limit: 4
    t.string  "CustomerName",    limit: 300
    t.integer "CustomerSiteID",  limit: 4
    t.string  "Address1",        limit: 300
    t.string  "Address2",        limit: 300
    t.string  "City",            limit: 100
    t.string  "State",           limit: 2
    t.string  "Zip",             limit: 10
    t.string  "Phone",           limit: 30
    t.integer "HostHotelID",     limit: 4
    t.integer "C_CustomerID",    limit: 4
    t.string  "CountryCode",     limit: 2
  end

  add_index "tfx_customers", ["CustomerID"], name: "cus_id", using: :btree

  create_table "tfx_hotelchains", primary_key: "HotelChainID", force: :cascade do |t|
    t.string  "ChainShortName", limit: 5,   null: false
    t.string  "ChainName",      limit: 200, null: false
    t.integer "OwnedByID",      limit: 4
  end

  create_table "tfx_hotels", primary_key: "HotelID", force: :cascade do |t|
    t.integer  "HotelChainID", limit: 4
    t.integer  "SiteID",       limit: 4
    t.string   "ShortName",    limit: 7
    t.string   "Name",         limit: 200, null: false
    t.string   "Address",      limit: 200
    t.string   "Address2",     limit: 200
    t.string   "City",         limit: 100, null: false
    t.string   "State",        limit: 50,  null: false
    t.string   "Zip",          limit: 10
    t.string   "Country",      limit: 100, null: false
    t.datetime "DateCreated",              null: false
    t.string   "Phone",        limit: 30
  end

  add_index "tfx_hotels", ["HotelChainID"], name: "FK_tfx_Hotels_tfx_HotelChains", using: :btree

  create_table "tfx_proxies", id: false, force: :cascade do |t|
    t.string   "Proxy",      limit: 30, null: false
    t.integer  "Port",       limit: 4,  null: false
    t.datetime "Expires",               null: false
    t.integer  "ProxyGroup", limit: 4,  null: false
  end

  create_table "tfx_searchrequestq", primary_key: "RequestQID", force: :cascade do |t|
    t.integer  "HotelID",           limit: 4,   null: false
    t.integer  "SiteID",            limit: 4,   null: false
    t.datetime "ArrivalDate",                   null: false
    t.string   "ArrivalDay",        limit: 3
    t.integer  "LOS",               limit: 4,   null: false
    t.integer  "RateTypeID",        limit: 4,   null: false
    t.integer  "RoomTypeID",        limit: 4
    t.integer  "Guests",            limit: 4,   null: false
    t.datetime "RunStartDate"
    t.datetime "RunCompleteDate"
    t.datetime "RequestDate",                   null: false
    t.string   "MachineName",       limit: 50
    t.integer  "RetryCount",        limit: 4
    t.integer  "RetriesBeforeFail", limit: 4
    t.integer  "ErrorCodeID",       limit: 4
    t.integer  "IsIncidental",      limit: 1
    t.string   "SessionID",         limit: 100
    t.string   "EmailAddress",      limit: 50
    t.integer  "IsTestRun",         limit: 1
    t.integer  "Activated",         limit: 1
  end

  create_table "tfx_siteparameterroles", primary_key: "SiteParameterRoleID", force: :cascade do |t|
    t.string "RoleDesc", limit: 50, null: false
  end

  add_index "tfx_siteparameterroles", ["SiteParameterRoleID"], name: "SiteParameterRoleID", using: :btree

  create_table "tfx_siteparameters", id: false, force: :cascade do |t|
    t.integer "HotelID",         limit: 4,   null: false
    t.integer "SiteID",          limit: 4,   null: false
    t.integer "ParameterRoleID", limit: 4,   null: false
    t.string  "ParameterValue",  limit: 300, null: false
  end

  add_index "tfx_siteparameters", ["ParameterRoleID"], name: "FK_tfx_SiteParameters_tfx_SiteParameterRoles", using: :btree
  add_index "tfx_siteparameters", ["SiteID"], name: "FK_tfx_SiteParameters_tfx_Sites", using: :btree

  create_table "tfx_sites", primary_key: "SiteID", force: :cascade do |t|
    t.string  "SiteDesc",          limit: 300, null: false
    t.boolean "IsBranded",                     null: false
    t.integer "SearchTypeID",      limit: 4,   null: false
    t.boolean "HaveDetailedRates"
    t.boolean "IsAvailable"
    t.boolean "IsActive"
  end

  create_table "tfx_v2_errorcodes", :id => false, force: :cascade do |t|
    t.string "ErrorCode", limit: 8,    null: false
    t.integer "ErrorCodeID", options: 'Primary Key'
    t.string "ErrorDesc", limit: 500,  null: false
    t.string "ErrorSQL",  limit: 1000, null: false
  end

  execute "ALTER TABLE `trendfxrates`.`tfx_v2_errorcodes` ADD PRIMARY KEY (`ErrorCode`);"

  create_table "tfx_v2_queue", id: false, force: :cascade do |t|
    t.integer  "RequestID",       limit: 4,   null: false
    t.integer  "HotelID",         limit: 4,   null: false
    t.integer  "SiteID",          limit: 4,   null: false
    t.datetime "ArrivalDate",                 null: false
    t.integer  "LOS",             limit: 4,   null: false
    t.integer  "DictionaryID",    limit: 4
    t.integer  "RoomTypeID",      limit: 4
    t.integer  "NumOfGuest",      limit: 4
    t.integer  "SearchProductID", limit: 4
    t.integer  "SearchEngineID",  limit: 4
    t.datetime "SearchStartDate"
    t.datetime "SearchStopDate"
    t.integer  "RetryCount",      limit: 4,   null: false
    t.integer  "MaxRetries",      limit: 4,   null: false
    t.string   "ErrorCode",       limit: 8
    t.string   "SessionID",       limit: 50,  null: false
    t.string   "MachineName",     limit: 50
    t.string   "EmailAddress",    limit: 100
    t.string   "ProxyUsed",       limit: 50
    t.boolean  "InProgress",                  null: false
  end

  add_index "tfx_v2_queue", ["ArrivalDate"], name: "ArrivalDate", using: :btree
  add_index "tfx_v2_queue", ["RequestID", "SessionID"], name: "RequestID", using: :btree

  create_table "tfx_v2_ratetypes", primary_key: "RateTypeID", force: :cascade do |t|
    t.string "RateTypeDesc",      limit: 50, null: false
    t.string "RateTypeDescShort", limit: 10, null: false
  end

  create_table "tfx_v2_scriptengines", primary_key: "ScriptEngineID", force: :cascade do |t|
    t.string "ScriptEngineDesc", limit: 200, null: false
    t.string "ScriptEngineExt",  limit: 5
    t.string "ScriptEngineApp",  limit: 20
  end

  create_table "tfx_v2_sitetimeouts", primary_key: "SiteID", force: :cascade do |t|
    t.integer "TimeOut", limit: 4, null: false
  end

  create_table "tfx_v2_unfilteredrates", primary_key: "RequestID", force: :cascade do |t|
    t.integer  "HotelID",      limit: 4,                             null: false
    t.integer  "SiteID",       limit: 4,                             null: false
    t.datetime "ArrivalDate",                                        null: false
    t.integer  "LOS",          limit: 4,                             null: false
    t.decimal  "Rate",                      precision: 12, scale: 2, null: false
    t.string   "RateDesc",     limit: 1500
    t.string   "ErrorCode",    limit: 8,                             null: false
    t.string   "CurrencyCode", limit: 10
    t.datetime "TimeInserted",                                       null: false
  end

  create_table "tfx_flashjobstatus", :id => false do |t|
    t.string "SessionID",       limit: 50,                           null: false
    t.datetime "StartDate",                                          null: false
    t.datetime "EndDate"
    t.integer "JobSize"
    t.boolean "Status"
  end

  create_table "tfx_l_contactregions", id: false, force: :cascade  do |t|
    t.integer "ContactID",                                            null: false
    t.integer "RegionID",                                             null: false
  end

  execute "ALTER TABLE `trendfxrates`.`tfx_l_contactregions` ADD PRIMARY KEY (ContactID,RegionID);"

  create_table "tfx_l_contactcustomers", id: false, force: :cascade  do |t|
    t.integer "ContactID",                                            null: false
    t.integer "CustomerID",                                           null: false
  end

  execute "ALTER TABLE `trendfxrates`.`tfx_l_contactcustomers` ADD PRIMARY KEY (ContactID,CustomerID);"

  create_table "tfx_customerregions", primary_key: "RegionID", force: :cascade do |t|
    t.string "RegionName",           limit: 300
    t.string "RegionShortName",       limit: 25
    t.integer "C_CustomerID",                                      null: false
  end

  create_table "tfx_l_regioncustomers", id: false, force: :cascade   do |t|
    t.integer "RegionID",                                             null: false
    t.integer "CustomerID",                                           null: false
  end

  execute "ALTER TABLE `trendfxrates`.`tfx_l_regioncustomers` ADD PRIMARY KEY (RegionID,CustomerID);"

  create_table "tfx_customerstage", primary_key: "CustomerStageID", force: :cascade do |t|
    t.integer "HotelChainID",                                         null: false
    t.integer "C_CustomerID",                                         null: false
    t.integer "RegionID"                                             
    t.string "CustomerName",          limit: 300,                     null: false
    t.string "Address",               limit: 300,                     null: false
    t.string "Address2"
    t.string "City",                                                  null: false
    t.string "State",                 limit: 2,                       null: false
    t.string "Zip",                   limit: 10,                      null: false
    t.string "Country",               limit: 100,                     null: false
    t.string "Phone",                 limit: 30,                      null: false
    t.integer "ReportLength",                                         null: false
    t.integer "ReportFrequency",                                      null: false
    t.boolean "FlashFlag",                                            null: false
    t.string "CustomerCode",          limit: 20
    t.string "ContactFirstName",      limit: 100,                     null: false
    t.string "ContactLastName",       limit: 100,                     null: false
    t.string "ContactEmail",          limit: 100,                     null: false
    t.string "DistrictCode",                                          null: false
    t.string "Contact2FirstName",     limit: 100,                    null: false
    t.string "Contact2LastName",      limit: 100,                    null: false
    t.string "Contact2Email",         limit: 100,                    null: false
    t.string "Contact3FirstName",     limit: 100,                    null: false
    t.string "Contact3LastName",      limit: 100,                    null: false
    t.string "Contact3Email",         limit: 100,                    null: false
    t.integer "Status",                                               null: false
    t.datetime "DateInserted",                                        null: false
    t.string "QAPass",                limit: 25
    t.datetime "QADate"
    t.string "LoginCode",             limit: 15
  end


  add_index "tfx_v2_unfilteredrates", ["SiteID", "HotelID"], name: "SiteID", using: :btree

  add_index "tfx_contacts", ["userid"], name: "index_tfx_Contacts_on_userid", unique: true, using: :btree


  add_foreign_key "tfx_customershoppinghotels", "tfx_customers", column: "CustomerID", primary_key: "CustomerID", name: "FK_cusID"
  add_foreign_key "tfx_customershoppinghotels", "tfx_hotels", column: "HotelID", primary_key: "HotelID", name: "FK_tfx_CustomerShoppingHotels_tfx_Hotels"
  add_foreign_key "tfx_customershoppingsites", "tfx_customers", column: "CustomerID", primary_key: "CustomerID", name: "FK_tfx_CustomerShoppingSites_tfx_Customers"
  add_foreign_key "tfx_customershoppingsites", "tfx_sites", column: "SiteID", primary_key: "SiteID", name: "FK_tfx_CustomerShoppingSites_tfx_Sites"
  add_foreign_key "tfx_hotels", "tfx_hotelchains", column: "HotelChainID", primary_key: "HotelChainID", name: "FK_tfx_Hotels_tfx_HotelChains"
  add_foreign_key "tfx_siteparameters", "tfx_hotels", column: "HotelID", primary_key: "HotelID", name: "FK_tfx_SiteParameters_tfx_Hotels"
  add_foreign_key "tfx_siteparameters", "tfx_siteparameterroles", column: "ParameterRoleID", primary_key: "SiteParameterRoleID", name: "FK_tfx_SiteParameters_tfx_SiteParameterRoles"
  add_foreign_key "tfx_siteparameters", "tfx_sites", column: "SiteID", primary_key: "SiteID", name: "FK_tfx_SiteParameters_tfx_Sites"
  add_foreign_key "tfx_l_contactcustomers", "tfx_contacts", column: "ContactID", primary_key: "ContactID", name: "FK_TFX_L_ContactCustomers_TFX_Contacts"
  add_foreign_key "tfx_l_contactcustomers", "tfx_customers", column: "CustomerID", primary_key: "CustomerID", name: "FK_TFX_L_ContactCustomers_tfx_customers"
  add_foreign_key "tfx_l_contactregions", "tfx_contacts", column: "ContactID", primary_key: "ContactID", name: "FK_TFX_L_ContactRegions_TFX_Contacts"
  
  add_foreign_key "tfx_l_regioncustomers", "tfx_customerregions", column: "RegionID", primary_key: "RegionID", name: "FK_TFX_L_RegionCustomers_TFX_CustomerRegions"

  add_foreign_key "tfx_customerregions", "tfx_corporatecustomers", column: "C_CustomerID", primary_key: "C_CustomerID", name: "FK_TFX_CustomerRegions_TFX_CorporateCustomers"
  #add_foreign_key "tfx_customerregions", "tfx_customerstage", column: "RegionID", primary_key: "RegionID", name: "FK_TFX_CustomerRegions_TFX_CustomerStage"

  
end



end


def self.down
  #drop all the tables if you really need
  #to support migration back to version 0

  end

end