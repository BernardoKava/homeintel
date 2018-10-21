json.extract! inventory, :id, :department, :active, :user_id, :period_from, :period_to, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
