class SavingRecon < ApplicationRecord
  belongs_to :user
  belongs_to :saving
  belongs_to :person
end
