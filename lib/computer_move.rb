require_relative "winning_move"

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
    empty_cell_indexes = @board.all_available_cells_indexes		
    n = rand(0..empty_cell_indexes.count-1)
    empty_cell_indexes[n]
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
    return 4 if @board.is_available_cell(4)
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
    return 0 if @board.is_available_cell(0)
    return 2 if @board.is_available_cell(2)
    return 6 if @board.is_available_cell(6)
    return 8 if @board.is_available_cell(8)
  end
  
end

