class Person < ApplicationRecord
  has_many :emails
  has_many :telephones
  has_many :addresses
  has_many :qualifications
  has_many :employments
  has_many :references
  has_many :comments
  has_many :departments
  has_many :banks

  accepts_nested_attributes_for :emails, allow_destroy: true
  accepts_nested_attributes_for :telephones, allow_destroy: true
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :qualifications, allow_destroy: true
  accepts_nested_attributes_for :employments, allow_destroy: true
  accepts_nested_attributes_for :references, allow_destroy: true
  accepts_nested_attributes_for :comments, allow_destroy: true
end
