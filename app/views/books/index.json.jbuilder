json.array!(@books) do |book|
  json.extract! book, :id, :title, :body, :author, :chamber, :public, :published
  json.url book_url(book, format: :json)
end
