json.extract! service_provider, :id, :name, :address, :telephone, :email, :acc_number, :user_id, :active, :link, :created_at, :updated_at
json.url service_provider_url(service_provider, format: :json)
