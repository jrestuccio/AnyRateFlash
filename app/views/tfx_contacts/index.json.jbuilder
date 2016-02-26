json.array!(@tfx_contacts) do |tfx_contact|
  json.extract! tfx_contact, :id, :FirstName, :LastName, :Email, :UserID, :Password, :Phone, :Expires
  json.url tfx_contact_url(tfx_contact, format: :json)
end
