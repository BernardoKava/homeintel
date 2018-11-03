class Financialinstitution < ApplicationRecord
  has_many :withdrawals
  has_many :lodgements
end
