class Integer
  def to_roman
    @@numeral = ''
    @@counter = self
    (@@counter % 5).times do
      @@numeral << 'I'
    end
    build_under_five
    @@numeral
  end

  def build_under_five
    (@@counter/5).times do
      @@numeral.prepend 'V'
      @@counter -= 5
    end
    (@@counter/4).times do
      @@numeral.prepend 'V'
      @@counter -= 3
    end
    build_under_three
  end

  def build_under_three
    @@counter.times do
      @@numeral.prepend 'I'
    end
  end

end
