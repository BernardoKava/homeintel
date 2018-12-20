class LoanRegistration < ApplicationRecord
  belongs_to :user
  belongs_to :person
  belongs_to :financialinstitution
  has_many :loan_managements
end
