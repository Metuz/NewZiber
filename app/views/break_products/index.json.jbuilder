json.array!(@break_products) do |break_product|
  json.extract! break_product, :id, :model, :serial, :brand_id, :report_id
  json.url break_product_url(break_product, format: :json)
end
