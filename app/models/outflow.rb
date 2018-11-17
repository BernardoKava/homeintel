class Outflow < ApplicationRecord
  belongs_to :cashflow
  belongs_to :person
  belongs_to :outflowtype
  belongs_to :bankaccount
end
