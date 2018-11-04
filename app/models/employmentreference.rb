class Employmentreference < ApplicationRecord
  belongs_to :person
  belongs_to :employment
end
