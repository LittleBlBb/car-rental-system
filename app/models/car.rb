class Car < ApplicationRecord
  belongs_to :location
  has_many :rentals
  has_many :users, through: :rentals
end
