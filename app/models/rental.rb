class Rental < ApplicationRecord
  belongs_to :car
  belongs_to :user
  # validates_uniqueness_of :car, scope: :user
end
