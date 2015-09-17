class WinningMove
  
  def initialize(board)
    @board = board
  end
  
  def pick_cell(player)
    available_cells_indexes = @board.all_available_cells_indexes
    cells_that_would_make_a_win = available_cells_indexes.select { |cell_index| 
      would_win(cell_index, player) 
    }
    cells_that_would_make_a_win.first
  end
   
  private 
  
  def would_win(cell_index, player)
    @board.clone
      .make_move_to(cell_index, player)
      .won?
  end

end

