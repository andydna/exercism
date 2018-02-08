class Crypto
  def initialize(plaintext)
    @plaintext = plaintext
  end

  def ciphertext
    return '' if @plaintext.empty?

    turn_it_sideways

    string_with_spaces
  end

  private

  def turn_it_sideways
    0.upto(rows.first.length - 1) do |column|
      chunks << make_chunk(rows, column)
    end
  end

  def string_with_spaces
    chunks.join(' ')
  end

  def chunks
    @chunks ||= []
  end

  def make_chunk(rows, column)
    rows.inject('') do |chunk, row|
      letter = row[column] ? row[column] : ' '
      chunk << letter
    end
  end

  def rows
    @rows ||= normalized.scan(/\w{1,#{columns_count}}/)
  end

  def normalized
    @plaintext.downcase
              .gsub(/\s/, '')
              .gsub(/\W/, '')
  end

  def columns_count
    Math.sqrt(normalized.length).ceil
  end
end

module BookKeeping
  VERSION = 1
end
