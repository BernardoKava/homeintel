class Financialinstitution < ApplicationRecord
  has_many :withdrawals
  has_many :lodgements
  has_many :bankaccounts
  has_many :loan_registrations
end
