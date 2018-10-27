class Item < ApplicationRecord
  belongs_to :inventory ,optional: true
  belongs_to :base_item
end
