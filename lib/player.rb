class Player

  def initialize(name)
    @name = name
  end

  def is?(other_player)
    other_player == self
  end

  def to_s
    return @name
  end

end
