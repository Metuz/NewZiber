json.array!(@products) do |product|
  json.extract! product, :id, :name, :category, :brand_id, :quantity, :location_id
  json.url product_url(product, format: :json)
end
