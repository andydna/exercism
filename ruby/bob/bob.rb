module Remark
  def silent?
    self.strip.length == 0
  end

  def shouting?
    self == self.upcase && self != self.downcase
  end

  def question?
    self.strip.end_with?('?')
  end
end

class Bob
  def self.hey remark 
    remark.extend Remark 
    case
    when remark.silent?
      "Fine. Be that way!"
    when remark.shouting?
      "Whoa, chill out!"
    when remark.question?
      "Sure."
    else
      "Whatever."
    end
  end
end

module BookKeeping
  VERSION = 1
end
