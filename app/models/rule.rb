class Rule < ApplicationRecord
  belongs_to :user
  belongs_to :rules_category
end
