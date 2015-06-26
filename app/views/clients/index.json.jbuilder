json.array!(@clients) do |client|
  json.extract! client, :id, :email, :postal_code, :phone_number
  json.url client_url(client, format: :json)
end
