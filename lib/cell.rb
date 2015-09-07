class Cell
	
  attr_reader :player
  
  def initialize(_)
    @player = nil
  end

  def is_available?
	  @player == nil
  end

  def set_to(player)
	  @player = player
  end
  
  def owned_by_same_player?(cell)
    !is_available? && !cell.is_available? && 
    cell.player.is?(@player)
  end
  
end
