json.extract! department, :id, :name, :description, :owner, :active, :user_id, :created_at, :updated_at
json.url department_url(department, format: :json)
