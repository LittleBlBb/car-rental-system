class Location < ApplicationRecord
  has_many :cars, dependent: :destroy

  validates :city, presence: true, uniqueness: { case_sensitive: false }
  validates :address, presence: true
end
