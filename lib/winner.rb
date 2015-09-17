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
    function_to_call = Proc.new do |i| cell_indexes_for_row(row_index, i); end
    player_for_win_combo(for_all_rows(function_to_call))
  end
  
  def player_for_winning_column(column_index)
    function_to_call = Proc.new do |i| cell_indexes_for_column(column_index, i); end
    player_for_win_combo(for_all_columns(function_to_call))
  end
  
  def player_for_diagonal_left_top_to_right_bottom
    player_for_win_combo(for_all_rows(method(:cell_indexes_diagonal_from_left_top)))
  end
  
  def player_for_diagonal_right_top_to_left_bottom
    player_for_win_combo(for_all_rows(method(:cell_indexes_diagonal_from_right_top)))
  end
  
  def cell_indexes_for_row(row_index, index)
    row_index * @board.rows_count + index
  end
  
  def cell_indexes_for_column(column_index, index)
    columns_count = @board.columns_count
    column_index + index * columns_count
  end
  
  def for_all_rows(f)
    (0..@board.rows_count-1).map {|i| f.call(i) }
  end
  
  def for_all_columns(f)
    (0..@board.columns_count-1).map {|i| f.call(i) }
  end
  
  def cell_indexes_diagonal_from_left_top(index)
    index * @board.columns_count + index
  end
  
  def cell_indexes_diagonal_from_right_top(index)
    next_index = index + 1
    next_index * @board.columns_count - next_index
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