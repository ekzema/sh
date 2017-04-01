json.extract! feed, :id, :name, :email, :phone, :description, :moderation, :created_at, :updated_at
json.url feed_url(feed, format: :json)
