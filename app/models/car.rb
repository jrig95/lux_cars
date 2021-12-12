class Car < ApplicationRecord
  belongs_to :user
  has_many :rentals
  validates :name, presence: true
  validates :description, presence: true
  validates :year, presence: true, numericality: { only_integer: true, less_than: 2022, greater_than: 1900 }
  validates :model, presence: true
  # validates :image, presence: true
  validates :location, presence: true

  def unavailable?
    rentals.any? do |rental|
      rental.status
    end
  end
end
