class Bst
  include Enumerable
  attr_reader :left, :right, :data
  def initialize(data)
    @data = data
  end

  def insert(branch)
    go_left branch if branch <= data
    go_right branch if branch > data
  end

  def each(&block)
    return to_enum(:each) unless block_given?
    left.each(&block) if left
    yield data
    right.each(&block) if right
  end

  private

  def go_left(branch)
    left ? left.insert(branch) : @left = Bst.new(branch)
  end

  def go_right(branch)
    right ? right.insert(branch) : @right = Bst.new(branch)
  end
end

module BookKeeping
  VERSION = 1
end
