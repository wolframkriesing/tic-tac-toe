require_relative "../lib/game_rules"
class Winner
	
  def initialize(board)
    @board = board
  end
	
  def find
    player_for_row_win or
    player_for_column_win or
    player_for_diagonal_win or
    nil
  end
  
  private
  
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
  
  def player_for_diagonal_win
    player_for_win_combo(0, 4, 8) or
    player_for_win_combo(2, 4, 6)
  end
  
  def player_for_win_combo(cell1, cell2, cell3)    
    first_cell = @board.cells[cell1]
    first_cell.player if cells_owned_by_same_player?(first_cell, @board.cells[cell2], @board.cells[cell3])
  end
  
  def cells_owned_by_same_player?(cell1, cell2, cell3)
    cell1.owned_by_same_player?(cell2) and 
    cell2.owned_by_same_player?(cell3)
  end
	
end