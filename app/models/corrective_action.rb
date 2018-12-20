class CorrectiveAction < ApplicationRecord
  belongs_to :issue_management
  belongs_to :person
end
