require 'pry'
class Clock
  class << self
    def at(hours, minutes)
      too_many_minutes = minutes % 60
      actual_minutes   = minutes - too_many_minutes
      binding.pry
      @hours   = hours + too_many_minutes
      @minutes = actual_minutes
      self
    end
     
    def to_s
      sprintf("%02d:%02d", hour, minute)
     end

    private

    def hour
      @hours % 24
    end

    def minute
      @minutes
    end
  end
end

if __FILE__ == $0
  asdf = Clock.new
  binding.pry
end
