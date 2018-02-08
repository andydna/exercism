class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    words.select { |word| anagram? word }
  end

  private

  def anagram?(word)
    same_letters?(word) && different_word?(word)
  end

  def same_letters?(word)
    word.downcase.chars.sort == @word.downcase.chars.sort
  end

  def different_word?(word)
    !@word.casecmp(word).zero?
  end
end

module BookKeeping
  VERSION = 2
end
