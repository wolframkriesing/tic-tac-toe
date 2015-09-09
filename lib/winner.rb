require_relative "../lib/game_rules"
class Winner
	
  def initialize(board)
    @board = board
  end
	
  def find
    player_for_row_win or
    player_for_column_win or
    player_for_win_combo(0, 4, 8) or
    player_for_win_combo(2, 4, 6) or
    nil
  end
  
  def player_for_row_win
    player_for_win_combo(0, 1, 2) or
    player_for_win_combo(3, 4, 5) or
    player_for_win_combo(6, 7, 8)
  end
  
  def player_for_column_win
    player_for_win_combo(0, 3, 6) or
    player_for_win_combo(1, 4, 7) or
    player_for_win_combo(2, 5, 8)
  end
  
  def player_for_win_combo(cell1, cell2, cell3)
    if cells_equal?(cell1, cell2, cell3)
      return @board[cell1].player
    end
  end
  
  def cells_equal?(cell1, cell2, cell3)
    @board[cell1].owned_by_same_player?(@board[cell2]) && 
    @board[cell2].owned_by_same_player?(@board[cell3])
  end
	
end