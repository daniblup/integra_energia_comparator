json.array!(@comparative_products) do |comparative_product|
  json.extract! comparative_product, :id, :amount, :hours_use
  json.url comparative_product_url(comparative_product, format: :json)
end
