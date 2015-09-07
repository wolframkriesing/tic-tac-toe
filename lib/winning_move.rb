require_relative "./game_rules"

class WinningMove
  
  def calculate_cell(board, computer_character, human_character)
    @board = board
    @computer_character = computer_character
    @human_character = human_character
    return player_would_win(computer_character) ||
      player_would_win(human_character) ||
      nil
  end
  
  private 
  
  def player_would_win(player)
    available_cells_indexes = all_available_cells_indexes
    cells_that_would_make_a_win = available_cells_indexes.select { |cell_index| 
      would_win(cell_index, player) 
    }
    cells_that_would_make_a_win.first
  end
   
  def all_available_cells_indexes
    available_cells_indexes = @board.select { |cell| cell.is_available? }
    available_cells_indexes.map { |cell| cell.to_i }
  end

  def would_win(cell_index, player)
    possible_board = @board.map { |cell| cell.clone }
    possible_board[cell_index].set_to(player)
    GameRules.new(possible_board).won?
  end

end

