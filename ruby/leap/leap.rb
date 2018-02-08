class Year
  def self.leap? year
    return false unless divisible_by 4, year 
    unless divisible_by 400, year 
      return false if divisible_by 100, year 
    end
    true
  end

  def self.divisible_by divisor, year
    year % divisor == 0
  end
end 

module BookKeeping
  VERSION = 3
end
