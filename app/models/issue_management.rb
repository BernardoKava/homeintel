class IssueManagement < ApplicationRecord
  belongs_to :user
  belongs_to :person
  has_many :corrective_actions
  has_many :comments

  accepts_nested_attributes_for :corrective_actions, allow_destroy: true
  accepts_nested_attributes_for :comments, allow_destroy: true
end
