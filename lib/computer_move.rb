require_relative "./winning_move"
require_relative "./random_move"

class ComputerMoveCore
  
  def initialize(board, computer_player, human_player)
    @board = board
    @computer_player = computer_player
    @human_player = human_player
  end
  
  def pick_cell
    random_move
  end  
  
  private 
  
  def random_move
    RandomMove.new(@board).pick_cell
  end

end

class ComputerMoveEasy < ComputerMoveCore
end

class ComputerMoveMedium < ComputerMoveCore
  
  def pick_cell
    winning_move or center_cell or super
  end
  
  private
  
  def center_cell
    return 4 if @board[4].is_available?
  end

  def winning_move
    winning_move = WinningMove.new(@board)    
    winning_move.pick_cell(@computer_player) ||
    winning_move.pick_cell(@human_player)
  end
  
end

class ComputerMoveHard < ComputerMoveMedium
  
  def pick_cell
    winning_move or center_cell or corner_cell or super
  end
  
  private
  
  def corner_cell
    return 0 if @board[0].is_available?
    return 2 if @board[2].is_available?
    return 6 if @board[8].is_available?
    return 8 if @board[8].is_available?
  end
  
end

