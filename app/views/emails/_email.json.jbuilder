json.extract! email, :id, :email, :user_id, :active, :person_id, :created_at, :updated_at
json.url email_url(email, format: :json)
