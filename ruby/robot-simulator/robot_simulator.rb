class Robot
  attr_reader :bearing, :coordinates
  def initialize
    @directions ||= [:north, :east, :south, :west]
  end

  def orient direction
    raise ArgumentError unless @directions.include? direction
    @bearing = direction
  end

  def turn_right
    index = @directions.index(@bearing)
    @directions.append @directions.shift
    @bearing = @directions[index]
  end

  def turn_left
    index = @directions.index(@bearing)
    @directions.prepend @directions.pop
    @bearing = @directions[index]
  end

  def at x, y
    @coordinates = [x, y]
  end

  def advance
    case @bearing
    when :north
      @coordinates[1] += 1
    when :south
      @coordinates[1] -= 1
    when :east
      @coordinates[0] += 1
    when :west
      @coordinates[0] -= 1
    end
  end

end

class Simulator
  def instructions instruction
    @instructions = []
    instruction.chars.each do |instruction|
      case instruction
      when 'L'
        @instructions << :turn_left
      when 'R'
        @instructions << :turn_right
      when 'A'
        @instructions << :advance
      end
    end
    @instructions
  end

  def place robot, x:, y:, direction:
    robot.at x, y
    robot.orient direction
  end

  def evaluate robot, instructions
    instructions = instructions(instructions)
    instructions.each do |instruction|
      robot.send instruction
    end
  end

end
