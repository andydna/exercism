class RunLengthEncoding
  def self.encode(input)
    input.chars.chunk_while do |this_one, next_one|
      this_one == next_one
    end.inject('') do |string, chunk|
      string << chunk.count.to_s unless chunk.one?
      string << chunk.first
    end
  end

  def self.decode(input)
    input.scan(/(\d*)(\D)/).map do |count, char|
      count.empty? ? char : char * count.to_i
    end.join
  end
end

module BookKeeping
  VERSION = 3
end
