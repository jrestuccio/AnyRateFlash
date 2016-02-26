json.array!(@tfx_customers) do |tfx_customer|
  json.extract! tfx_customer, :id, :CustoemrID, :LoginCode, :CustomerChainID, :CustomerName, :CustomerSiteID, :Address1, :Address2, :City, :State, :Zip, :Phone, :HostHotelID, :C_CustomerID, :CountryCode
  json.url tfx_customer_url(tfx_customer, format: :json)
end
