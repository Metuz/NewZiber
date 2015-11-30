json.array!(@pages) do |page|
  json.extract! page, :id, :text1, :text2, :text3, :text4, :text5, :text6, :text7, :text8, :text9, :text10
  json.url page_url(page, format: :json)
end
