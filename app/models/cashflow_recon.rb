class CashflowRecon < ApplicationRecord
  belongs_to :user
  belongs_to :cashflow
  belongs_to :person
end
