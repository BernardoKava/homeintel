class Budget < ApplicationRecord
  has_many :comments , dependent: :destroy
  has_many :incomes ,  dependent: :destroy
  has_many :expenses,  dependent: :destroy

  accepts_nested_attributes_for :incomes, allow_destroy: true
  accepts_nested_attributes_for :expenses, allow_destroy: true
  accepts_nested_attributes_for :comments, allow_destroy: true
end
