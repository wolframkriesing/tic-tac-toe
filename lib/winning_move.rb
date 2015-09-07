require_relative "./game_rules"

class WinningMove
  
  def initialize(board)
    @board = board
  end
  
  def calculate_cell_for_win(player)
    available_cells_indexes = all_available_cells_indexes
    cells_that_would_make_a_win = available_cells_indexes.select { |cell_index| 
      would_win(cell_index, player) 
    }
    cells_that_would_make_a_win.first
  end
   
  private 
  
  def all_available_cells_indexes
    indexes = @board.map.with_index { |cell, index| 
      cell.is_available? ? index : nil
    }
    indexes.select {|index| index != nil}
  end

  def would_win(cell_index, player)
    possible_board = @board.map { |cell| cell.clone }
    possible_board[cell_index].set_to(player)
    GameRules.new(possible_board).won?
  end

end

