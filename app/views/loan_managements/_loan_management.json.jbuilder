json.extract! loan_management, :id, :year, :month, :loan_registration_id, :payment_date, :amount, :note, :user_id, :created_at, :updated_at
json.url loan_management_url(loan_management, format: :json)
