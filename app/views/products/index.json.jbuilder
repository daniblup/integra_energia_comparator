json.array!(@products) do |product|
  json.extract! product, :id, :name, :consumption_w, :name_equiv, :consumption_w_equiv, :price_equiv
  json.url product_url(product, format: :json)
end
