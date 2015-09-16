require "minitest/autorun"
require_relative "../lib/board"

class BoardTests < MiniTest::Unit::TestCase

  def test_baord_with_default_number_of_rows
	board = Board.empty
	assert_equal board.cells.length, 9
  end
  
end
