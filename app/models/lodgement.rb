class Lodgement < ApplicationRecord
  belongs_to :saving
  belongs_to :financialinstitution
  belongs_to :person



end
