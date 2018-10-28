class Item < ApplicationRecord
  belongs_to :inventory ,optional: true
end
