class PrimeFactors
  def self.for(given)
    new(given).prime_factors
  end

  def initialize(given)
    @leftover = given
    @divisor = 2
    @factors = []
  end

  def prime_factors
    until @leftover == 1
      if remainder_zero
        shovel_the_factor
        divide_for_new_leftover
      else
        increment_divisor
      end
    end
    @factors
  end

  def increment_divisor
    @divisor += 1
  end

  def shovel_the_factor
    @factors << @divisor
  end

  def remainder_zero
    (@leftover % @divisor).zero?
  end

  def divide_for_new_leftover
    @leftover /= @divisor
  end
end
