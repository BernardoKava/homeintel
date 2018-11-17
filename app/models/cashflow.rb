class Cashflow < ApplicationRecord

  has_many :inflows, dependent: :destroy
  has_many :outflows, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :cashflow_recons, dependent: :destroy

  accepts_nested_attributes_for :inflows, allow_destroy: true
  accepts_nested_attributes_for :outflows, allow_destroy: true
  accepts_nested_attributes_for :comments, allow_destroy: true
end
