json.array!(@chapters) do |chapter|
  json.extract! chapter, :id, :title, :body, :published, :public, :author
  json.url chapter_url(chapter, format: :json)
end
