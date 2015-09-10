require_relative "./cell"

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
      
  def is_available_cell(cell_index)
    is_valid_cell_index(cell_index) and self[cell_index].is_available?
  end
  
  private
  
  def is_valid_cell_index(cell_index)
    (0..self.length) === cell_index
  end

	
end
