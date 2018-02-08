class SumOfMultiples
  def initialize *multiples
    @multiples = *multiples
  end

  def to the_top
    @multiples.flat_map do |multiple|
      (0...the_top).step(multiple).to_a
    end.uniq.sum
  end
end

module BookKeeping
  VERSION = 2
end
