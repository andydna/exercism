class Phrase

  def initialize phrase
    @phrase = phrase
  end

  def words
    @phrase.downcase
           .gsub(" '", ' ')
           .gsub("' ", ' ')
           .gsub("'", 'Z')
           .gsub(',',' ')
           .gsub(/\W/, ' ')
           .gsub('Z', "'")
           .split
  end

  def word_count
    hash = {}
    words.uniq.each do |word|
      hash[word] = words.count(word)
    end
    hash
  end

end

module BookKeeping
  VERSION = 1
end
