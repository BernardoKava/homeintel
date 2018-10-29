class Comment < ApplicationRecord
  belongs_to :inventory, optional: true
  belongs_to :person, optional: true
  belongs_to :budget, optional: true
  belongs_to :cashflow, optional: true
  belongs_to :saving, optional: true
end
