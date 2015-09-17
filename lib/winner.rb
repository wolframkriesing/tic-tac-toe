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
    columns_count = @board.columns_count
    (0..columns_count-1)
      .map {|column_index| player_for_winning_column(column_index) }
      .select {|player| player != nil}
      .first
  end
  
  def player_for_winning_column(column_index)
    player_for_win_combo(column_index + 0, column_index + 3, column_index + 6)
  end
  
  def player_for_diagonal_win
    player_for_win_combo(0, 4, 8) or
    player_for_win_combo(2, 4, 6)
  end
  
  def player_for_win_combo(cell1, cell2, cell3)    
    # first_cell = @board.cells[cell1]
    # first_cell.player if cells_owned_by_same_player?([first_cell, @board.cells[cell2], @board.cells[cell3]])
    _player_for_win_combo([cell1, cell2, cell3])
  end
  
  def _player_for_win_combo(cell_indexes)    
    first_cell = @board.cells[cell_indexes[0]]
    cells = cell_indexes.map {|cell_index| @board.cells[cell_index] }
    first_cell.player if cells_owned_by_same_player?(cells)
  end
  
  def cells_owned_by_same_player?(cells)
    first_cell = cells[0]
    cells_owned_by_same_player = cells.select {|cell| cell.owned_by_same_player?(first_cell)}
    cells_owned_by_same_player.length == cells.length
  end
	
end