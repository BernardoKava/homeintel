class Employment < ApplicationRecord
  belongs_to :person
  has_many :employmentreferences
end
