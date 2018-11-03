class Delivery < ApplicationRecord
  has_many :posts
  has_many :comments
  belongs_to :person
  accepts_nested_attributes_for :posts,allow_destroy: true
  accepts_nested_attributes_for :comments,allow_destroy: true
end
