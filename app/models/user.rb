class User < ApplicationRecord
  has_many :rentals, dependent: :destroy
  has_many :cars, through: :rentals
  validates :name,
            presence: true,
            format: { with: /\A[А-Яа-яёЁA-Za-z]+\z/,
                      message: "only allows letters" }
  validates :phone_number, presence: true,
            format: { with: /\A\+?\d{10,12}\z/,
                      message: "number must start with '+' and contain 12 symbols" },
            uniqueness: { case_sensitive: false }

  validates :email,
            presence: true,
            format: { with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/,
                      message: "Invalid email" },
            uniqueness: { case_sensitive: false }
end
