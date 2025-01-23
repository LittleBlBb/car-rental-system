class Car < ApplicationRecord
  belongs_to :location
  has_many :rentals, dependent: :destroy
  has_many :users, through: :rentals
  validates :brand, presence: true
  validates :model, presence: true
  validates :price_per_day, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :location, presence: true
end
