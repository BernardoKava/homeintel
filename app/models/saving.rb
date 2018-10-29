class Saving < ApplicationRecord
  has_many :lodgements
  has_many :withdrawals
  has_many :comments

  accepts_nested_attributes_for :lodgements, allow_destroy: true
  accepts_nested_attributes_for :withdrawals, allow_destroy: true
  accepts_nested_attributes_for :comments, allow_destroy: true
end
