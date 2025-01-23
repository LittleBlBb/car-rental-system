class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validate :dates_do_not_overlap

  private

  def dates_do_not_overlap
    overlapping_rentals = Rental.where(car_id: car_id)
                                .where.not(id: id)
                                .where("start_date < ? AND end_date > ?", start_date, end_date)

    if overlapping_rentals.exists?
      errors.add(:base, "This car already rented. Choose another date or car.")
    end
  end
end
