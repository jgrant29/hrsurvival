json.array!(@tableofcontents) do |tableofcontent|
  json.extract! tableofcontent, :id, :title, :description, :body, :public, :author
  json.url tableofcontent_url(tableofcontent, format: :json)
end
