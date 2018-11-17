class Financialinstitution < ApplicationRecord
  has_many :withdrawals
  has_many :lodgements
  has_many :bankaccounts
end
