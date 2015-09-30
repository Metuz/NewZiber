json.array!(@products) do |product|
  json.extract! product, :id, :name, :category_id, :brand_id, :location_id, :quantity
  json.url product_url(product, format: :json)
end
