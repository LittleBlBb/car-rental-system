class DiscountCalculator
  def initialize(rental, discount_strategy)
    @rental = rental
    @discount_strategy = discount_strategy
  end

  def calculate
    @discount_strategy.calculate(@rental)
  end
end
