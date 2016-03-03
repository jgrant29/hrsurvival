json.array!(@emails) do |email|
  json.extract! email, :id, :name, :email, :company, :permissions
  json.url email_url(email, format: :json)
end
