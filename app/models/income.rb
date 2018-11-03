class Income < ApplicationRecord
  belongs_to :budget
  belongs_to :inflowtype
  belongs_to :person


end
