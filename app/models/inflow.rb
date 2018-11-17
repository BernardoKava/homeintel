class Inflow < ApplicationRecord
  belongs_to :cashflow
  belongs_to :person
  belongs_to :inflowtype
  belongs_to :bankaccount





end
