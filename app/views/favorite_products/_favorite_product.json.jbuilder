json.extract! favorite_product, :id, :products_id, :sellers_id, :created_at, :updated_at
json.url favorite_product_url(favorite_product, format: :json)
