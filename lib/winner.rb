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
      .map {|row_index| player_for_winning_row(row_index) }
      .select {|player| player != nil}
      .first
  end
  
  def player_for_winning_row(row_index)
    rows_count = @board.rows_count
    offset = row_index * rows_count
    cell_indexes = (0..rows_count-1).map {|index| offset + index}
    player_for_win_combo(cell_indexes)
  end
  
  def player_for_column_win
    columns_count = @board.columns_count
    (0..columns_count-1)
      .map {|column_index| player_for_winning_column(column_index) }
      .select {|player| player != nil}
      .first
  end
  
  def player_for_winning_column(column_index)
    columns_count = @board.columns_count
    cell_indexes = (0..columns_count-1).map {|index| column_index + index*columns_count}
    player_for_win_combo(cell_indexes)
  end
  
  def player_for_diagonal_win
    return player_for_diagonal_left_top_to_right_bottom || player_for_diagonal_right_top_to_left_bottom
  end
  
  def player_for_diagonal_left_top_to_right_bottom
    rows_count = @board.rows_count
    cell_indexes = (0..rows_count-1).map {|index| index + index*rows_count}
    player_for_win_combo(cell_indexes)
  end
  
  def player_for_diagonal_right_top_to_left_bottom
    rows_count = @board.rows_count
    cell_indexes = (1..rows_count).map {|index| index*rows_count - index}
    player_for_win_combo(cell_indexes)
  end
  
  def player_for_win_combo(cell_indexes)    
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