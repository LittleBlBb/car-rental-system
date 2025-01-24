class VipDiscount < DiscountStrategy
  def calculate(rental)
    if rental.days > 7
      rental.base_price * 0.8
    elsif rental.days > 3
      rental.base_price * 0.9
    else
      rental.base_price
    end
  end
end