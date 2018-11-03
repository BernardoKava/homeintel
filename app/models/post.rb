class Post < ApplicationRecord
  belongs_to :delivery
  belongs_to :person
end
