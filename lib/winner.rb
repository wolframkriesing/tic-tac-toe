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
    winning_rows.first
  end
  
  def player_for_column_win
    winning_columns.first
  end

  def player_for_diagonal_win
    return player_for_diagonal_left_top_to_right_bottom || player_for_diagonal_right_top_to_left_bottom
  end
    
  def winning_rows
    rows_count = @board.rows_count
    (0..rows_count-1)
      .map {|row_index| player_for_winning_row(row_index) }
      .select {|player| player != nil}
  end
  
  def winning_columns
    columns_count = @board.columns_count
    (0..columns_count-1)
      .map {|column_index| player_for_winning_column(column_index) }
      .select {|player| player != nil}
  end
  
  def player_for_winning_row(row_index)
    rows_count = @board.rows_count
    offset = row_index * rows_count
    cell_indexes = (0..rows_count-1).map {|index| offset + index}
    player_for_win_combo(cell_indexes)
  end
  
  def player_for_winning_column(column_index)
    columns_count = @board.columns_count
    cell_indexes = (0..columns_count-1).map {|index| column_index + index*columns_count}
    player_for_win_combo(cell_indexes)
  end
  
  def player_for_diagonal_left_top_to_right_bottom
    rows_count = @board.rows_count
    cell_indexes = (0..rows_count-1).map {|i| cell_indexes_diagonal_from_left_top(i) }
    player_for_win_combo(cell_indexes)
  end
  
  def player_for_diagonal_right_top_to_left_bottom
    rows_count = @board.rows_count
    cell_indexes = (0..rows_count-1).map {|i| cell_indexes_diagonal_from_right_top(i) }
    player_for_win_combo(cell_indexes)
  end
  
  def cell_indexes_diagonal_from_left_top(index)
    index * @board.rows_count + index
  end
  
  def cell_indexes_diagonal_from_right_top(index)
    next_index = index + 1
    next_index * @board.rows_count - next_index
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