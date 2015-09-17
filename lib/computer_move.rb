require_relative "winning_move"

class CellPicker

  def initialize(board, player1=nil, player2=nil)
    @board = board
    @player1 = player1
    @player2 = player2
  end
  
  def random_move
    empty_cell_indexes = @board.all_available_cells_indexes		
    n = rand(0..empty_cell_indexes.count-1)
    empty_cell_indexes[n]
  end
  
  def center_cell
    return 4 if @board.is_available_cell?(4)
  end

  def winning_move
    winning_move = WinningMove.new(@board)    
    winning_move.pick_cell(@player1) ||
    winning_move.pick_cell(@player2)
  end
  
  def corner_cell
    return 0 if @board.is_available_cell?(0)
    return 2 if @board.is_available_cell?(2)
    return 6 if @board.is_available_cell?(6)
    return 8 if @board.is_available_cell?(8)
  end
  
end

class ComputerMoveEasy

  def initialize(board, player1, player2)
    @cell_picker = CellPicker.new(board, player1, player2)
  end
  
  def pick_cell
    @cell_picker.random_move
  end  

end

class ComputerMoveMedium < ComputerMoveEasy
  
  def pick_cell
    @cell_picker.winning_move or 
    @cell_picker.center_cell or 
    super
  end
  
end

class ComputerMoveHard < ComputerMoveMedium
  
  def pick_cell
    @cell_picker.winning_move or 
    @cell_picker.center_cell or 
    @cell_picker.corner_cell or 
    super
  end
  
end

