class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :car

  before_save :calculate_total_price

  validate :dates_do_not_overlap

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  def days
    return 0 unless start_date.present? && end_date.present?
    (end_date - start_date).to_i
  end

  def base_price
    return 0 unless days > 0 && car.present?
    days * car.price_per_day
  end

  def calculate_total_price
    if self.user.vip?
      self.total_price = DiscountCalculator.new(self, VipDiscount.new).calculate
    else
      self.total_price = DiscountCalculator.new(self, LongTermDiscount.new).calculate
    end
  end

  private

  def end_date_after_start_date
    if start_date.present? && end_date.present? && end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def dates_do_not_overlap
    overlapping_rentals = Rental.where(car_id: car_id)
                                .where.not(id: id)
                                .where("start_date < ? AND end_date > ?", start_date, end_date)

    if overlapping_rentals.exists?
      errors.add(:base, "This car already rented. Choose another date or car.")
    end
  end
end
