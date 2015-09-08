class Cell
	
  attr_reader :player
  
  def initialize
    @player = nil
  end

  def is_available?
	  @player == nil
  end

  def occupy_by(player)
	  @player = player
  end
  
  def owned_by_same_player?(cell)
    !is_available? && !cell.is_available? && 
    cell.player.is?(@player)
  end
  
end
