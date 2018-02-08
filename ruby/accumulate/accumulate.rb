class Array

  def accumulate
    ot = []
    self.map do |item|
      ot << yield(item)
    end
    ot
  end

end

module BookKeeping
  VERSION = 1
end
