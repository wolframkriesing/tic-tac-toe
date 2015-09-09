require_relative "./winner"

class GameRules
  
  def initialize(board)
    @board = board
  end

  def won?
    Winner.new(@board).find != nil
  end
  
  def game_over?
    won? or tie?
  end
  
  def tie?
    !won? && @board.all_cells_occupied?
  end

end