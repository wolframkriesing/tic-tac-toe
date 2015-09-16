require "minitest/autorun"
require_relative "../lib/board"

class DefaultBoardTests < MiniTest::Unit::TestCase

  def empty_board
	  board = Board.empty
  end

  def test_board_has_9_cells
	  assert_equal empty_board.cells.length, 9
  end
  
  def test_board_has_3_rows
  	assert_equal empty_board.rows_count, 3
  end
  
end

class BoardTests < MiniTest::Unit::TestCase

  def test_board_with_2_rows
    board = Board.new 2
    assert_equal board.cells.length, 4
  end
  
end
