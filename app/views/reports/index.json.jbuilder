json.array!(@reports) do |report|
  json.extract! report, :id, :client_id, :user_id
  json.url report_url(report, format: :json)
end
