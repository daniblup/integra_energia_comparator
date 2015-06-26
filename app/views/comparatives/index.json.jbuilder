json.array!(@comparatives) do |comparative|
  json.extract! comparative, :id, :current_cost, :integra_cost, :installation_cost, :amortization_term
  json.url comparative_url(comparative, format: :json)
end
