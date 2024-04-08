json.extract! product, :id, :code, :description, :guy, :amount, :extend, :brand, :purchase_price, :sale_price, :created_at, :updated_at
json.url product_url(product, format: :json)
