json.extract! book, :id, :body, :created_at, :updated_at
json.url book_url(book, format: :json)
