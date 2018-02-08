require 'minitest/autorun'
require_relative 'bowling'

# Common test data version: 1.0.1 26e345e
class BowlingTest < Minitest::Test
  def setup
    @game = Game.new
    @frame = Game::Frame.new
  end

  def record(rolls)
    rolls.each { |pins| @game.roll(pins) }
  end

  def test_frame_zero_rolls_zero_score
    @frame.roll 0
    @frame.roll 0
    assert_equal 0, @frame.score
  end

  def test_frame_roll_4_roll_5_score_is_9
    @frame.roll 4
    @frame.roll 5
    assert_equal 9, @frame.score
  end

  def test_frame_spare
    @frame.roll 5
    @frame.roll 5
    assert @frame.spare?
  end

  def test_frame_spare_score_when_next_roll
    @frame.roll 5
    @frame.roll 5
    assert_equal 15, @frame.score(bonus: 5)
  end

  def test_frame_strike
    @frame.roll 10
    assert @frame.strike?
  end

  def test_frame_strike_score
    @frame.roll 10
    assert_equal 12, @frame.score(bonus: 2)
  end

  def test_new_frame_isnt_done
    refute @frame.done?
  end

  def test_frame_with_two_zero_rolls_is_done
    @frame.roll 0
    @frame.roll 0
    assert @frame.done?
  end

  def test_strike_frame_is_done
    @frame.roll 10
    assert @frame.done?
  end

  def test_one_roll_one_frame
    record([0])
    assert_equal 1, @game.frames.count
  end

  def test_two_rolls_one_frame
    record([1, 1])
    assert_equal 1, @game.frames.count
  end

  def test_three_rolls_two_frames
    record([2, 2, 2])
    assert_equal 2, @game.frames.count
  end

  def test_lame_game_has_ten_frames
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_equal 10, @game.frames.count
  end

  def test_should_be_able_to_score_a_game_with_all_zeros
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_equal 0, @game.score
  end

  def test_should_be_able_to_score_a_game_with_no_strikes_or_spares
    record([3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6])
    assert_equal 90, @game.score
  end

  def test_a_spare_followed_by_zeros_is_worth_ten_points
    record([6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_equal 10, @game.score
  end

  def test_points_scored_in_the_roll_after_a_spare_are_counted_twice
    record([6, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_equal 16, @game.score
  end

  def test_consecutive_spares_each_get_a_one_roll_bonus
    record([5, 5, 3, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_equal 31, @game.score
  end

  def test_game_knows_if_last_frame
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7])
    assert @game.last_frame?
  end

  def test_game_knows_if_last_frame_false
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7])
    refute @game.last_frame?
  end

  def test_a_spare_in_the_last_frame_gets_a_one_roll_bonus_that_is_counted_once
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 7])
    assert_equal 17, @game.score
  end

  def test_first_roll_10_calling_spare_on_frame_doesnt_error
    @game.roll 10
    frame = @game.frames.last
    refute frame.spare?
  end

  def test_a_strike_earns_ten_points_in_a_frame_with_a_single_roll
    record([10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_equal 10, @game.score
  end

  def test_points_scored_in_the_two_rolls_after_a_strike_are_counted_twice_as_a_bonus
    record([10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_equal 26, @game.score
  end

  def test_consecutive_strikes_each_get_the_two_roll_bonus
    record([10, 10, 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_equal 81, @game.score
  end

  def test_a_strike_in_the_last_frame_gets_a_two_roll_bonus_that_is_counted_once
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 1])
    assert_equal 18, @game.score
  end

  def test_rolling_a_spare_with_the_two_roll_bonus_does_not_get_a_bonus_roll
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 3])
    assert_equal 20, @game.score
  end

  def test_strikes_with_the_two_roll_bonus_do_not_get_bonus_rolls
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10])
    assert_equal 30, @game.score
  end

  def test_a_strike_with_the_one_roll_bonus_after_a_spare_in_the_last_frame_does_not_get_a_bonus
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 10])
    assert_equal 20, @game.score
  end

  def test_all_strikes_is_a_perfect_game
    record([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
    assert_equal 300, @game.score
  end

  def test_rolls_cannot_score_negative_points
    record([])
    assert_raises Game::BowlingError do
      @game.roll(-1)
    end
  end

  def test_a_roll_cannot_score_more_than_10_points
    record([])
    assert_raises Game::BowlingError do
      @game.roll(11)
    end
  end

  def test_two_rolls_in_a_frame_cannot_score_more_than_10_points
    record([5])
    assert_raises Game::BowlingError do
      @game.roll(6)
    end
  end

  def test_bonus_roll_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10])
    assert_raises Game::BowlingError do
      @game.roll(11)
    end
  end

  def test_two_bonus_rolls_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points
    record([0, 0,
            0, 0,
            0, 0,
            0, 0,
            0, 0, 
            0, 0,
            0, 0,
            0, 0,
            0, 0, # ninth frame
            10, 5])
    assert_raises Game::BowlingError do
      @game.roll(6)
    end
  end

  def test_two_bonus_rolls_after_a_strike_in_the_last_frame_can_score_more_than_10_points_if_one_is_a_strike
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 6])
    assert_equal 26, @game.score
  end

  def test_the_second_bonus_rolls_after_a_strike_in_the_last_frame_cannot_be_a_strike_if_the_first_one_is_not_a_strike
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 6])
    assert_raises Game::BowlingError do
      @game.roll(10)
    end
  end

  def test_second_bonus_roll_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10])
    assert_raises Game::BowlingError do
      @game.roll(11)
    end
  end

  def test_an_unstarted_game_cannot_be_scored
    skip
    record([])
    assert_raises Game::BowlingError do
      @game.score
    end
  end

  def test_an_incomplete_game_cannot_be_scored
    skip
    record([0, 0])
    assert_raises Game::BowlingError do
      @game.score
    end
  end

  def test_cannot_roll_if_game_already_has_ten_frames
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    assert_raises Game::BowlingError do
      @game.roll(0)
    end
  end

  def test_bonus_rolls_for_a_strike_in_the_last_frame_must_be_rolled_before_score_can_be_calculated
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10])
    assert_raises Game::BowlingError do
      @game.score
    end
  end

  def test_both_bonus_rolls_for_a_strike_in_the_last_frame_must_be_rolled_before_score_can_be_calculated
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10])
    assert_raises Game::BowlingError do
      @game.score
    end
  end

  def test_bonus_roll_for_a_spare_in_the_last_frame_must_be_rolled_before_score_can_be_calculated
    skip
    record([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3])
    assert_raises Game::BowlingError do
      @game.score
    end
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html
  def test_bookkeeping
    skip
    assert_equal 3, BookKeeping::VERSION
  end
end
