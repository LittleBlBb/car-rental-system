class DiscountStrategy
  def calculate(rental)
    raise NotImplementedError, "Subclasses must implement calculate(rental)"
  end
end