class LoanManagement < ApplicationRecord
  belongs_to :user
  belongs_to :loan_registration
end
