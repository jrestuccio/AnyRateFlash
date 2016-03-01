json.array!(@tfx_contacts) do |tfx_contact|
  json.extract! tfx_contact, :id, :ContactID, :FirstName, :LastName, :EMail, :UserID, :Password, :Phone, :Ext, :Expires
  json.url tfx_contact_url(tfx_contact, format: :json)
end
