class Comment < ApplicationRecord
  belongs_to :inventory, optional: true
end
