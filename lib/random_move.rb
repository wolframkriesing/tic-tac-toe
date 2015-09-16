class RandomMove
	
  def initialize(board)
	@board = board
  end
  
  def pick_cell
	empty_cell_indexes = @board.all_available_cells_indexes		
	n = rand(0..empty_cell_indexes.count-1)
  	empty_cell_indexes[n]
  end
	
end