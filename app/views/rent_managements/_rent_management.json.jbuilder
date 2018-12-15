json.extract! rent_management, :id, :year, :month, :amount, :date_collected, :details, :collected_by, :user_id, :created_at, :updated_at
json.url rent_management_url(rent_management, format: :json)
