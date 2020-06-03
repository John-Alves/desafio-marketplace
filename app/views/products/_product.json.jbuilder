json.extract! product, :id, :name, :price, :installments, :image, :url, :created_at, :updated_at
json.url product_url(product, format: :json)
