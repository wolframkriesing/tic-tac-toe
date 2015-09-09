class Board < Array
	
  def self.empty
    board = Board.new
    board.concat([
      Cell.new, Cell.new, Cell.new,
      Cell.new, Cell.new, Cell.new,
      Cell.new, Cell.new, Cell.new
    ])
    board
  end
  
  def all_cells_occupied?
    self.all? { |cell| !cell.is_available? }
  end
	
end
