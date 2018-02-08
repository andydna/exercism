class Prime
  class << self
    def nth(n)
      raise ArgumentError if n.zero?
      primes = []
      counter = 2
      loop do
        primes << counter if counter.is_prime?
        break if primes.count == n
        counter += 1
      end
      return primes.last
    end
  end
end

class Integer
  def is_prime?
    return false if self == 1
    2.upto (Math.sqrt(self).floor) do |counter|
      return false if self % counter == 0
    end
    return true
  end
end

module BookKeeping
  VERSION = 1
end
