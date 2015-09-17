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
    rows_count = @board.rows_count
    (0..rows_count-1)
      .map {|row_index| player_for_winning_row(row_index, rows_count) }
      .select {|player| player != nil}
      .first
  end
  
  def player_for_winning_row(row_index, rows_count)
    offset = row_index * rows_count
    player_for_win_combo(offset + 0, offset + 1, offset + 2)
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