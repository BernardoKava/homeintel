json.extract! budget, :id, :user_id, :month, :year, :budget_date, :name, :created_at, :updated_at
json.url budget_url(budget, format: :json)
