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

ActiveRecord::Schema.define(version: 20160303045832) do

  create_table "TFX_CompsetProfiles", id: false, force: :cascade do |t|
    t.integer "CustomerID",        limit: 4,                          null: false
    t.integer "HotelID",           limit: 4,                          null: false
    t.integer "Rooms",             limit: 4
    t.decimal "Stars",                       precision: 18, scale: 2
    t.decimal "DistanceFromHost",            precision: 18, scale: 2
    t.decimal "TripAdvisorRating",           precision: 18, scale: 2
  end

  create_table "TFX_Contacts", primary_key: "ContactID", force: :cascade do |t|
    t.string   "FirstName", limit: 100, null: false
    t.string   "LastName",  limit: 100, null: false
    t.string   "EMail",     limit: 100, null: false
    t.string   "UserID",    limit: 100, null: false
    t.string   "Password",  limit: 20,  null: false
    t.integer  "Phone",     limit: 8
    t.integer  "Ext",       limit: 8
    t.datetime "Expires",               null: false
  end

  create_table "TFX_CorporateCustomers", primary_key: "C_CustomerID", force: :cascade do |t|
    t.string  "C_LoginCode",       limit: 15
    t.integer "C_CustomerChainID", limit: 4
    t.string  "C_CustomerName",    limit: 600
    t.string  "Address1",          limit: 600, default: "N/A"
    t.string  "Address2",          limit: 600
    t.string  "City",              limit: 200
    t.string  "State",             limit: 2
    t.string  "Zip",               limit: 20
    t.string  "Phone",             limit: 10
  end

  create_table "TFX_CurrencyCodes", primary_key: "CurrencyCode", force: :cascade do |t|
    t.string "Country", limit: 255, null: false
  end

  create_table "TFX_CurrencyExchange", primary_key: "CurrencyCode", force: :cascade do |t|
    t.decimal "ExchangeRate", precision: 19, scale: 4, null: false
  end

  create_table "TFX_CurrencyTranslations", id: false, force: :cascade do |t|
    t.string  "CurrencyCode", limit: 3,   null: false
    t.string  "Word",         limit: 100, null: false
    t.integer "SiteID",       limit: 4,   null: false
  end

  add_index "TFX_CurrencyTranslations", ["SiteID"], name: "FK_TFX_CurrencyTranslations_TFX_Sites", using: :btree

  create_table "TFX_CustomerPreferenceRoles", primary_key: "PrefRoleID", force: :cascade do |t|
    t.string  "PrefRoleDesc",    limit: 200, null: false
    t.string  "PrefRoleName",    limit: 200
    t.string  "PrefDataType",    limit: 7,   null: false
    t.integer "PrefDependency",  limit: 4
    t.integer "PrefDataLength",  limit: 4
    t.string  "PrefDataTable",   limit: 25
    t.string  "PrefDataDefault", limit: 50
  end

  create_table "TFX_CustomerPreferences", primary_key: "CustomerPreferenceID", force: :cascade do |t|
    t.integer "CustomerID",       limit: 4
    t.integer "ContactID",        limit: 4
    t.integer "PreferenceRoleID", limit: 4,   null: false
    t.string  "PreferenceValue",  limit: 100, null: false
    t.integer "SiteID",           limit: 4
    t.integer "HotelID",          limit: 4
  end

  add_index "TFX_CustomerPreferences", ["PreferenceRoleID"], name: "FK_TFX_CustomerPreferences_TFX_CustomerPreferenceRoles", using: :btree

  create_table "TFX_CustomerRegions", primary_key: "RegionID", force: :cascade do |t|
    t.string  "RegionName",      limit: 600
    t.string  "RegionShortName", limit: 50
    t.integer "C_CustomerID",    limit: 4,   null: false
  end

  add_index "TFX_CustomerRegions", ["C_CustomerID"], name: "FK_TFX_CustomerRegions_TFX_CorporateCustomers", using: :btree

  create_table "TFX_CustomerShoppingHotels", id: false, force: :cascade do |t|
    t.integer "CustomerID", limit: 4, null: false
    t.integer "HotelID",    limit: 4, null: false
  end

  add_index "TFX_CustomerShoppingHotels", ["HotelID"], name: "FK_TFX_CustomerShoppingHotels_TFX_Hotels", using: :btree

  create_table "TFX_CustomerShoppingSites", id: false, force: :cascade do |t|
    t.integer "CustomerID", limit: 4, null: false
    t.integer "SiteID",     limit: 4, null: false
  end

  add_index "TFX_CustomerShoppingSites", ["SiteID"], name: "FK_TFX_CustomerShoppingSites_TFX_Sites", using: :btree

  create_table "TFX_Customers", primary_key: "CustomerID", force: :cascade do |t|
    t.string  "LoginCode",       limit: 15
    t.integer "CustomerChainID", limit: 4
    t.string  "CustomerName",    limit: 600
    t.integer "CustomerSiteID",  limit: 4
    t.string  "Address1",        limit: 600, default: "N/A"
    t.string  "Address2",        limit: 600
    t.string  "City",            limit: 200
    t.string  "State",           limit: 2
    t.string  "Zip",             limit: 20
    t.integer "Phone",           limit: 8
    t.integer "HostHotelID",     limit: 4
    t.integer "C_CustomerID",    limit: 4
    t.string  "CountryCode",     limit: 2
  end

  create_table "TFX_FlashJobStatus", id: false, force: :cascade do |t|
    t.string   "SessionID", limit: 50, null: false
    t.datetime "StartDate",            null: false
    t.datetime "EndDate"
    t.integer  "JobSize",   limit: 4
    t.string   "Status",    limit: 1
  end

  create_table "TFX_FlashLog", id: false, force: :cascade do |t|
    t.integer  "ContactID", limit: 4,   null: false
    t.string   "SessionID", limit: 100, null: false
    t.datetime "RunDate",               null: false
  end

  create_table "TFX_HotelChains", primary_key: "HotelChainID", force: :cascade do |t|
    t.string  "ChainShortName", limit: 10,  null: false
    t.string  "ChainName",      limit: 400, null: false
    t.integer "OwnedByID",      limit: 4
  end

  create_table "TFX_Hotels", primary_key: "HotelID", force: :cascade do |t|
    t.integer  "HotelChainID", limit: 4
    t.integer  "SiteID",       limit: 4
    t.string   "ShortName",    limit: 7
    t.string   "Name",         limit: 400,                 null: false
    t.string   "Address",      limit: 400
    t.string   "Address2",     limit: 400
    t.string   "City",         limit: 200,                 null: false
    t.string   "State",        limit: 100, default: "N/A", null: false
    t.string   "Zip",          limit: 20
    t.string   "Country",      limit: 200,                 null: false
    t.datetime "DateCreated",                              null: false
    t.integer  "Phone",        limit: 8
  end

  add_index "TFX_Hotels", ["HotelChainID"], name: "FK_TFX_Hotels_TFX_HotelChains", using: :btree

  create_table "TFX_L_ContactCustomers", id: false, force: :cascade do |t|
    t.integer "ContactID",  limit: 4, null: false
    t.integer "CustomerID", limit: 4, null: false
  end

  add_index "TFX_L_ContactCustomers", ["CustomerID"], name: "FK_TFX_L_ContactCustomers_TFX_Customers", using: :btree

  create_table "TFX_L_ContactRegions", id: false, force: :cascade do |t|
    t.integer "ContactID", limit: 4, null: false
    t.integer "RegionID",  limit: 4, null: false
  end

  add_index "TFX_L_ContactRegions", ["RegionID"], name: "FK_TFX_L_ContactRegions_TFX_CustomerRegions", using: :btree

  create_table "TFX_L_RegionCustomers", id: false, force: :cascade do |t|
    t.integer "RegionID",   limit: 4, null: false
    t.integer "CustomerID", limit: 4, null: false
  end

  create_table "TFX_Proxies", id: false, force: :cascade do |t|
    t.string   "Proxy",      limit: 30, null: false
    t.integer  "Port",       limit: 4,  null: false
    t.datetime "Expires",               null: false
    t.integer  "ProxyGroup", limit: 4,  null: false
  end

  create_table "TFX_SearchRequestQ", primary_key: "RequestQID", force: :cascade do |t|
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
    t.boolean  "IsIncidental"
    t.string   "SessionID",         limit: 100
    t.string   "EmailAddress",      limit: 50
    t.boolean  "IsTestRun"
    t.boolean  "Activated"
  end

  create_table "TFX_SiteParameterRoles", primary_key: "SiteParameterRoleID", force: :cascade do |t|
    t.string "RoleDesc", limit: 50, null: false
  end

  create_table "TFX_SiteParameters", id: false, force: :cascade do |t|
    t.integer "HotelID",         limit: 4,   null: false
    t.integer "SiteID",          limit: 4,   null: false
    t.integer "ParameterRoleID", limit: 4,   null: false
    t.string  "ParameterValue",  limit: 300, null: false
  end

  add_index "TFX_SiteParameters", ["ParameterRoleID"], name: "FK_TFX_SiteParameters_TFX_SiteParameterRoles", using: :btree

  create_table "TFX_Sites", primary_key: "SiteID", force: :cascade do |t|
    t.string  "SiteDesc",          limit: 300,                 null: false
    t.boolean "IsBranded",                     default: false, null: false
    t.integer "SearchTypeID",      limit: 4,   default: 1,     null: false
    t.boolean "HaveDetailedRates",             default: false
    t.boolean "IsAvailable"
    t.boolean "IsActive"
  end

  create_table "TFX_V2_ErrorCodes", primary_key: "ErrorCodeID", force: :cascade do |t|
    t.string "ErrorCode", limit: 8,    null: false
    t.string "ErrorDesc", limit: 500,  null: false
    t.string "ErrorSQL",  limit: 1000, null: false
  end

  create_table "TFX_V2_L_ContactShoppingCurrencies", primary_key: "ContactID", force: :cascade do |t|
    t.string "CurrencyCode", limit: 3, null: false
  end

  create_table "TFX_V2_L_LexiconRateTypes", id: false, force: :cascade do |t|
    t.integer "WordID",     limit: 4, default: 0, null: false
    t.integer "RateTypeID", limit: 4, default: 0, null: false
    t.integer "LexiconID",  limit: 4, default: 0, null: false
  end

  add_index "TFX_V2_L_LexiconRateTypes", ["LexiconID"], name: "FK_TFX_V2_L_LexiconRateTypes_TFX_V2_LexiconDesc", using: :btree
  add_index "TFX_V2_L_LexiconRateTypes", ["RateTypeID"], name: "FK_TFX_V2_L_LexiconRateTypes_TFX_V2_RateTypes", using: :btree
  add_index "TFX_V2_L_LexiconRateTypes", ["WordID", "RateTypeID", "LexiconID"], name: "IX_TFX_V2_L_LexiconRateTypes", using: :btree

  create_table "TFX_V2_Lexicon", primary_key: "WordID", force: :cascade do |t|
    t.string "Word", limit: 100
  end

  create_table "TFX_V2_LexiconDesc", primary_key: "LexiconID", force: :cascade do |t|
    t.string "LexiconCode", limit: 3,   null: false
    t.string "LexiconDesc", limit: 500, null: false
  end

  create_table "TFX_V2_Queue", primary_key: "RequestID", force: :cascade do |t|
    t.integer  "HotelID",         limit: 4,                   null: false
    t.integer  "SiteID",          limit: 4,                   null: false
    t.datetime "ArrivalDate",                                 null: false
    t.integer  "LOS",             limit: 4,                   null: false
    t.integer  "DictionaryID",    limit: 4
    t.integer  "RoomTypeID",      limit: 4
    t.integer  "NumOfGuest",      limit: 4
    t.integer  "SearchProductID", limit: 4
    t.integer  "SearchEngineID",  limit: 4
    t.datetime "SearchStartDate"
    t.datetime "SearchStopDate"
    t.integer  "RetryCount",      limit: 4,   default: 0,     null: false
    t.integer  "MaxRetries",      limit: 4,   default: 2,     null: false
    t.string   "ErrorCode",       limit: 8
    t.string   "SessionID",       limit: 50,                  null: false
    t.string   "MachineName",     limit: 50
    t.string   "EmailAddress",    limit: 100
    t.string   "ProxyUsed",       limit: 50
    t.boolean  "InProgress",                  default: false, null: false
  end

  create_table "TFX_V2_RateTypes", primary_key: "RateTypeID", force: :cascade do |t|
    t.string "RateTypeDesc",      limit: 50, null: false
    t.string "RateTypeDescShort", limit: 10, null: false
  end

  create_table "TFX_V2_ScriptEngines", primary_key: "ScriptEngineID", force: :cascade do |t|
    t.string "ScriptEngineDesc", limit: 200, null: false
    t.string "ScriptEngineExt",  limit: 5
    t.string "ScriptEngineApp",  limit: 20
  end

  create_table "TFX_V2_SiteTimeOuts", primary_key: "SiteID", force: :cascade do |t|
    t.integer "TimeOut", limit: 4, null: false
  end

  create_table "TFX_V2_UnfilteredRates", id: false, force: :cascade do |t|
    t.integer  "RequestID",    limit: 4,                                             null: false
    t.integer  "HotelID",      limit: 4,                                             null: false
    t.integer  "SiteID",       limit: 4,                                             null: false
    t.datetime "ArrivalDate",                                                        null: false
    t.integer  "LOS",          limit: 4,                                             null: false
    t.decimal  "Rate",                      precision: 19, scale: 4,                 null: false
    t.string   "RateDesc",     limit: 1500
    t.string   "ErrorCode",    limit: 8,                                             null: false
    t.string   "CurrencyCode", limit: 10,                            default: "USD"
    t.datetime "TimeInserted",                                                       null: false
  end

  add_index "TFX_V2_UnfilteredRates", ["HotelID", "SiteID"], name: "IX_TFX_V2_UnfilteredRatesns_HotelID_SiteID", using: :btree

  add_foreign_key "TFX_CurrencyExchange", "TFX_CurrencyCodes", column: "CurrencyCode", primary_key: "CurrencyCode", name: "FK_TFX_CurrencyExchange_TFX_CurrencyCodes"
  add_foreign_key "TFX_CurrencyTranslations", "TFX_CurrencyCodes", column: "CurrencyCode", primary_key: "CurrencyCode", name: "FK_TFX_CurrencyTranslations_TFX_CurrencyCodes"
  add_foreign_key "TFX_CurrencyTranslations", "TFX_Sites", column: "SiteID", primary_key: "SiteID", name: "FK_TFX_CurrencyTranslations_TFX_Sites"
  add_foreign_key "TFX_CustomerPreferences", "TFX_CustomerPreferenceRoles", column: "PreferenceRoleID", primary_key: "PrefRoleID", name: "FK_TFX_CustomerPreferences_TFX_CustomerPreferenceRoles"
  add_foreign_key "TFX_CustomerRegions", "TFX_CorporateCustomers", column: "C_CustomerID", primary_key: "C_CustomerID", name: "FK_TFX_CustomerRegions_TFX_CorporateCustomers"
  add_foreign_key "TFX_CustomerShoppingHotels", "TFX_Customers", column: "CustomerID", primary_key: "CustomerID", name: "FK_TFX_CustomerShoppingHotels_TFX_Customers"
  add_foreign_key "TFX_CustomerShoppingHotels", "TFX_Hotels", column: "HotelID", primary_key: "HotelID", name: "FK_TFX_CustomerShoppingHotels_TFX_Hotels"
  add_foreign_key "TFX_CustomerShoppingSites", "TFX_Customers", column: "CustomerID", primary_key: "CustomerID", name: "FK_TFX_CustomerShoppingSites_TFX_Customers"
  add_foreign_key "TFX_CustomerShoppingSites", "TFX_Sites", column: "SiteID", primary_key: "SiteID", name: "FK_TFX_CustomerShoppingSites_TFX_Sites"
  add_foreign_key "TFX_Hotels", "TFX_HotelChains", column: "HotelChainID", primary_key: "HotelChainID", name: "FK_TFX_Hotels_TFX_HotelChains"
  add_foreign_key "TFX_L_ContactCustomers", "TFX_Contacts", column: "ContactID", primary_key: "ContactID", name: "FK_TFX_L_ContactCustomers_TFX_Contacts"
  add_foreign_key "TFX_L_ContactCustomers", "TFX_Customers", column: "CustomerID", primary_key: "CustomerID", name: "FK_TFX_L_ContactCustomers_TFX_Customers"
  add_foreign_key "TFX_L_ContactRegions", "TFX_Contacts", column: "ContactID", primary_key: "ContactID", name: "FK_TFX_L_ContactRegions_TFX_Contacts"
  add_foreign_key "TFX_L_ContactRegions", "TFX_CustomerRegions", column: "RegionID", primary_key: "RegionID", name: "FK_TFX_L_ContactRegions_TFX_CustomerRegions"
  add_foreign_key "TFX_L_RegionCustomers", "TFX_CustomerRegions", column: "RegionID", primary_key: "RegionID", name: "FK_TFX_L_RegionCustomers_TFX_CustomerRegions"
  add_foreign_key "TFX_SiteParameters", "TFX_SiteParameterRoles", column: "ParameterRoleID", primary_key: "SiteParameterRoleID", name: "FK_TFX_SiteParameters_TFX_SiteParameterRoles"
  add_foreign_key "TFX_V2_L_LexiconRateTypes", "TFX_V2_Lexicon", column: "WordID", primary_key: "WordID", name: "FK_TFX_V2_L_LexiconRateTypes_TFX_V2_Lexicon"
  add_foreign_key "TFX_V2_L_LexiconRateTypes", "TFX_V2_LexiconDesc", column: "LexiconID", primary_key: "LexiconID", name: "FK_TFX_V2_L_LexiconRateTypes_TFX_V2_LexiconDesc"
  add_foreign_key "TFX_V2_L_LexiconRateTypes", "TFX_V2_RateTypes", column: "RateTypeID", primary_key: "RateTypeID", name: "FK_TFX_V2_L_LexiconRateTypes_TFX_V2_RateTypes"
end
