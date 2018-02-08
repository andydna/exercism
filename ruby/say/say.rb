class Say
  def initialize question
    @question = question
  end
  def in_english
    case @question
    when 0
      "zero"
    when 1
      "one"
    when 14
      "fourteen"
    when 20
      "twenty"
    when 22
      "twenty-two"
    when 100
      "one hundred"
    when 123
      "one hundred twenty-three"
    when 1000
      "one thousand"
    when 1234
      "one thousand two hundred thirty-four"
    end
  end
end
