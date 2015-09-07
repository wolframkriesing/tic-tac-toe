require_relative "./game_rules"

class WinningMove
  def calculate_cell(board, computer_character, human_character)
    @computer_character = computer_character
    @human_character = human_character
    available_cells_indexes = all_available_cells_indexes(board)
    cell_for_winning_move = winning_move(board, available_cells_indexes)
    if cell_for_winning_move
      return cell_for_winning_move
    end
    return nil
  end
  
  private 
  
  def all_available_cells_indexes(board)
    available_cells_indexes = board.select { |cell| cell.is_available? }
    available_cells_indexes.map { |cell| cell.to_i }
  end
  
  def winning_move(board, available_cells_indexes)
    cells_that_would_make_a_win = available_cells_indexes.select { |cell_index| 
      is_winning_move(board, cell_index) 
    }
    cells_that_would_make_a_win.first
  end
  
  def would_win(board, cell_index, character)
    possible_board = board.map { |cell| cell.clone }
    possible_board[cell_index].set_to(character)
    GameRules.new(possible_board).won?
  end
  
  def would_computer_win(board, cell_index)
    would_win(board, cell_index, @computer_character)
  end

  def would_human_win(board, cell_index)
    would_win(board, cell_index, @human_character)
  end

  def is_winning_move(board, cell_index)
    would_computer_win(board, cell_index) or would_human_win(board, cell_index)
  end
end

