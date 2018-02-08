class Robot
  attr_reader :name
  def initialize
    reset
  end

  def reset
    @name = random_name
  end

  def random_name
    Kernel.srand
    alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWZYZ'
    digits = '1234567890'
    name = ''
    2.times do
      name << alphabet.chars.shuffle.pop
    end
    3.times do
      name << digits.chars.shuffle.pop
    end
    name
  end

  def self.forget
  end
end

module BookKeeping
  VERSION = 3
end
