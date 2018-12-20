json.extract! loan_registration, :id, :financialinstitution_id, :loan_type, :loan_term, :rationale, :amount, :loan_reference, :drawdown_date, :final_payment_date, :user_id, :person_id, :created_at, :updated_at
json.url loan_registration_url(loan_registration, format: :json)
