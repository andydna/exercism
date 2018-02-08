# not done and ugly.
# hints? what am i doing wrong? what do i read to understand how to fix the conditional octopus?
class Game
  BowlingError = Class.new(StandardError)
  def roll(pins)
    raise BowlingError unless (0..10).cover? pins
    frames << Frame.new unless frames.last
    frames << Frame.new if frames.last.done? unless last_frame?
    frame = frames.last
    raise BowlingError if frame.score + pins > 10 unless last_frame?
    #raise BowlingError if last_frame? && frame.strike? && frame.score + pins > 20
    frame.roll pins
  end

  def score
    total = 0
    frames.each_with_index do |frame, index|
      next_frame = frames[index+1]
      unless next_frame
        total += frame.score
        next
      end
      if frame.strike?
        if next_frame.strike?
          first_bonus = next_frame.rolls.first
          if frames[index+2]
            second_bonus = frames[index+2].rolls.first
          else
            second_bonus = 10
          end
          bonus = first_bonus + second_bonus
        else
          bonus = next_frame.rolls.sum
        end
        total += frame.score bonus: bonus 
      elsif frame.spare?
        bonus = next_frame.rolls.first
        total += frame.score bonus: bonus
      else
        total += frame.score
      end
    end
    total
  end

  def last_frame?
    frames.count == 10
  end

  def frames
    @frames ||= []
  end

  class Frame
    def roll(pins)
      rolls << pins
    end

    def score(bonus: 0)
      rolls.sum + bonus
    end

    def rolls
      @rolls ||= []
    end

    def strike?
      rolls.first == 10
    end

    def spare?
      rolled_twice and rolls.sum == 10
    end

    def done?
      rolled_twice or strike?
    end

    def rolled_twice
      rolls.count == 2
    end
  end
end
