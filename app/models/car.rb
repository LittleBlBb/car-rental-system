class Car < ApplicationRecord
  belongs_to :location
  has_many :rentals, dependent: :destroy
  has_many :users, through: :rentals
end
