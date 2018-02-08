class Scale
  def initialize root, mode
    @root = root
    @mode = mode
  end

  def name
    "#{@root.upcase} #{@mode.to_s}"
  end

end
