class Cashflow < ApplicationRecord

  has_many :inflows
  has_many :outflows
  has_many :comments

  accepts_nested_attributes_for :inflows, allow_destroy: true
  accepts_nested_attributes_for :outflows, allow_destroy: true
  accepts_nested_attributes_for :comments, allow_destroy: true
end
