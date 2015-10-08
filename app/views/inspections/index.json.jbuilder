json.array!(@inspections) do |inspection|
  json.extract! inspection, :id, :title, :comment, :finish, :keep_goin
  json.url inspection_url(inspection, format: :json)
end
