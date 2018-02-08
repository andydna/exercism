class Series
  def initialize(digits)
    @digits = digits.to_s
  end

  def slices(length)
    raise ArgumentError if length > @digits.length
    (0..@digits.length - length).map do |index|
      @digits[index, length]
    end
  end
end
