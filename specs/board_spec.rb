require "minitest/autorun"
require_relative "../lib/board"

class BoardTests < MiniTest::Unit::TestCase

  def test_board_with_default_number_of_rows
	board = Board.empty
	assert_equal board.cells.length, 9
  end
  
  def test_baord_with_2_rows
	board = Board.with_number_of_rows 2
	board.empty_all_cells
	assert_equal board.cells.length, 4
  end
  
end
