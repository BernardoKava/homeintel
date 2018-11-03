class Expense < ApplicationRecord
  belongs_to :budget
  belongs_to :outflowtype
  belongs_to :person

end
