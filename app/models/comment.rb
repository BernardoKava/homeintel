class Comment < ApplicationRecord
  belongs_to :inventory, optional: true
  belongs_to :person, optional: true
end
