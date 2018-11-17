class Bankaccount < ApplicationRecord
  belongs_to :financialinstitution
  belongs_to :person
  has_many   :outflows
  has_many   :inflows

end
