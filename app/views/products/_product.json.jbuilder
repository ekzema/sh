json.extract! product, :id, :size, :price, :quality, :category_id, :twocategory_id, :threecategory_id, :created_at, :updated_at
json.url product_url(product, format: :json)