class Car < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :year, presence: true, numericality: { only_integer: true, less_than: 2022, greater_than: 1900 }
  validates :model, presence: true
  # validates :image, presence: true
  validates :location, presence: true
end
