require_relative "../lib/random_move"
require_relative "../lib/cell"
require_relative "./boards"
require "minitest/autorun"

class MyBoards < Boards
  
  def self.one_cell_empty(cell_index)
	  board = Boards.tie_board
	  board[cell_index] = Cell.new(cell_index.to_s)
	  board
  end
  
  def self.two_cells_empty(cell_index, cell_index1)
	  board = Boards.tie_board
	  board[cell_index] = Cell.new(cell_index.to_s)
	  board[cell_index1] = Cell.new(cell_index1.to_s)
	  board
  end
  
  private 
  
  def self.occupied_cell_by(x,y)
	Boards.occupied_cell_by(x,y)
  end
	 
end


class PickAvailableCellOnly < MiniTest::Unit::TestCase

  def test_all_empty
	cell = RandomMove.new(Boards.empty_board).pick_cell
	assert_equal (0..8) === cell, true
  end

  def test_one_empty
	cell = RandomMove.new(MyBoards.one_cell_empty(3)).pick_cell
	assert_equal cell, 3
  end
  
  def test_two_empty_to_contain_both_for_multiple_runs
	cells = []
	100.times do 
		cells.push RandomMove.new(MyBoards.two_cells_empty(3, 4)).pick_cell
	end
	assert_equal cells.count {|index| index == 3} > 0, true
	assert_equal cells.count {|index| index == 4} > 0, true
  end
  
  def test_all_empty_to_contain_all_for_lots_of_runs
	cells = []
	random_move = RandomMove.new(MyBoards.empty_board)
	1000.times do 
		cells.push random_move.pick_cell
	end
	assert_equal cells.count {|index| index == 0} > 0, true
	assert_equal cells.count {|index| index == 1} > 0, true
	assert_equal cells.count {|index| index == 2} > 0, true
	assert_equal cells.count {|index| index == 3} > 0, true
	assert_equal cells.count {|index| index == 4} > 0, true
	assert_equal cells.count {|index| index == 5} > 0, true
	assert_equal cells.count {|index| index == 6} > 0, true
	assert_equal cells.count {|index| index == 7} > 0, true
	assert_equal cells.count {|index| index == 8} > 0, true
  end
    
end