class Comment < ApplicationRecord
  belongs_to :inventory, optional: true
  belongs_to :person, optional: true
  belongs_to :cashflow, optional: true
  belongs_to :saving, optional: true
  belongs_to :delivery,optional: true
  belongs_to :budget,optional: true
  belongs_to :issue_management,optional: true
  belongs_to :saving,optional: true
end
