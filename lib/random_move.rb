class RandomMove
	
  def initialize(board)
	@board = board
  end
  
  def pick_cell
	empty_cell_indexes = @board
		.map.with_index {|cell, i| cell.is_available? ? i : nil }
		.select {|index| index != nil}
		
	n = rand(0..empty_cell_indexes.count-1)
  	empty_cell_indexes[n]
  end
	
end