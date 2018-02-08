class Trinary
  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    return 0 if @trinary.scan(/[^0123]/).count > 0
    total = 0
    @trinary.reverse.chars.each_with_index do |digit, power|
      total += digit.to_i * 3**power
    end
    total
  end
end

module BookKeeping
  VERSION = 1
end
