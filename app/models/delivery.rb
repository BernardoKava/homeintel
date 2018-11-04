class Delivery < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :person
  accepts_nested_attributes_for :posts,allow_destroy: true
  accepts_nested_attributes_for :comments,allow_destroy: true
end
