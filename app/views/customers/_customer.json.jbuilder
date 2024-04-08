json.extract! customer, :id, :identification, :name, :phone, :created_at, :updated_at
json.url customer_url(customer, format: :json)
