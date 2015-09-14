json.array!(@articles) do |article|
  json.extract! article, :id, :name, :user_id, :text, :image, :description, :keywords
  json.url article_url(article, format: :json)
end
