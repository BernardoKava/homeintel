class Outflowtype < ApplicationRecord
  has_many :expenses
  has_many :outflows

end
