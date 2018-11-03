class Department < ApplicationRecord
  has_many :inventories
  belongs_to :person

end
