class Grains
  def self.square nth_square 
    raise ArgumentError unless (1..64).include?(nth_square)
    2 ** (nth_square - 1)
  end

  def self.total
    (1..64).inject(0) {|grains, square| grains += square(square)}
  end
end

module BookKeeping
  VERSION = 1
end
