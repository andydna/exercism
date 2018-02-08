class Binary
  def self.to_decimal binary
    raise ArgumentError if binary.scan(/[^01]/).count > 0
    decimal = 0
    binary.reverse.chars.each_with_index do |bit, index|
      decimal += bit.to_i * (2 ** index.to_i)
    end
    decimal.to_i
  end
end

module BookKeeping
  VERSION = 3
end
