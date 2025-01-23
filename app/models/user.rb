class User < ApplicationRecord
  has_many :rentals
  has_many :cars, through: :rentals

  validates :phone_number, presence: true, uniqueness: { case_sensitive: false }
end
