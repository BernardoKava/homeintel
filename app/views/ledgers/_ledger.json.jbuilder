json.extract! ledger, :id, :month, :year, :ledger_date, :name, :user_id, :created_at, :updated_at
json.url ledger_url(ledger, format: :json)
