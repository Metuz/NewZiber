json.array!(@shipping_costs) do |shipping_cost|
  json.extract! shipping_cost, :id, :serial,, :company,, :report_id, :date
  json.url shipping_cost_url(shipping_cost, format: :json)
end
