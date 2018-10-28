class Budget < ApplicationRecord
  has_many :comments
  has_many :incomes
  has_many :expenses

  accepts_nested_attributes_for :incomes, allow_destroy: true
  accepts_nested_attributes_for :expenses, allow_destroy: true
  accepts_nested_attributes_for :comments, allow_destroy: true
end
