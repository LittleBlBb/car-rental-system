class Location < ApplicationRecord
  has_many :cars, dependent: :destroy
end
