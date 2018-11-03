class Outflow < ApplicationRecord
  belongs_to :cashflow
  belongs_to :person
  belongs_to :outflowtype

end
