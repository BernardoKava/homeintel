class Inventory < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :items, dependent: :destroy
  belongs_to :department



  accepts_nested_attributes_for :items, allow_destroy: true
  accepts_nested_attributes_for :comments, allow_destroy: true
end
