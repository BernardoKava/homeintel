json.extract! base_item, :id, :name, :description, :owner, :active, :user_id, :created_at, :updated_at
json.url base_item_url(base_item, format: :json)
