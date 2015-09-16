require_relative "./cell"

class Board
	
  attr_reader :cells
  def initialize(cells)
    @cells = cells
  end
  
  def self.with_number_of_rows(rows)
    Board.new(Array.new(rows * rows))
  end
  
  def empty_all_cells
    @cells = @cells.map do |cell| Cell.new; end
  end
  
  def self.empty
    board = Board.with_number_of_rows(3)
    board.empty_all_cells
    board
  end
  
  def clone
    Board.new(@cells.map { |cell| cell.clone })
  end
  
  def make_move_to(cell_index, player)
    @cells[cell_index].occupy_by(player)
  end
  
  def all_cells_occupied?
    @cells.all? { |cell| !cell.is_available? }
  end
      
  def is_available_cell?(cell_index)
    is_available_cell(cell_index)
  end
  
  def is_available_cell(cell_index)
    is_valid_cell_index(cell_index) and @cells[cell_index].is_available?
  end
  
  def all_available_cells_indexes
    indexes = @cells.map.with_index { |cell, index| 
      cell.is_available? ? index : nil
    }
    indexes.select {|index| index != nil}
  end


  
  private
  
  def is_valid_cell_index(cell_index)
    (0..@cells.length) === cell_index
  end
	
end
