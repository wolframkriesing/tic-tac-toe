require_relative "./game_rules"

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
    possible_board = @board.clone
    possible_board.make_move_to(cell_index, player)
    GameRules.new(possible_board).won?
  end

end

