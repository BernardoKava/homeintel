json.extract! bank, :id, :name, :address, :user_id, :iban, :bic, :accessibility, :active, :created_at, :updated_at
json.url bank_url(bank, format: :json)
