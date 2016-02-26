json.array!(@tfx_corporate_customers) do |tfx_corporate_customer|
  json.extract! tfx_corporate_customer, :id, :C_CustomerID, :C_LoginCode, :C_CustomerChainID, :C_CustomerName, :Address1, :Address2, :City, :State, :Zip, :Phone
  json.url tfx_corporate_customer_url(tfx_corporate_customer, format: :json)
end
