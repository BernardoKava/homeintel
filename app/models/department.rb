class Department < ApplicationRecord
  has_many :inventories
  belongs_to :person
  belongs_to :cashflow
  belongs_to :budget
end
