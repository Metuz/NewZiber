json.array!(@costs) do |cost|
  json.extract! cost, :id, :name, :quantity, :price, :totla, :report_id
  json.url cost_url(cost, format: :json)
end
