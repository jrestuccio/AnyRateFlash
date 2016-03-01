json.array!(@tfx_hotels) do |tfx_hotel|
  json.extract! tfx_hotel, :id, :HotelID, :HotelChainID, :SiteID, :ShortName, :Name, :Address, :Address2, :City, :State, :Zip, :Country, :DateCreated, :Phone
  json.url tfx_hotel_url(tfx_hotel, format: :json)
end
