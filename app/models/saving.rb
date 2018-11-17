class Saving < ApplicationRecord
  has_many :lodgements, dependent: :destroy
  has_many :withdrawals, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :saving_recons, dependent: :destroy

  accepts_nested_attributes_for :lodgements, allow_destroy: true
  accepts_nested_attributes_for :withdrawals, allow_destroy: true
  accepts_nested_attributes_for :comments, allow_destroy: true
end
