require_relative "./boards"
require "minitest/autorun"

class WinningMoveTest < MiniTest::Unit::TestCase
	
  def test_for_an_empty_board_there_is_none
	  cell = WinningMove.new.calculate_cell(Boards.empty_board, "X", "O")
	  assert_equal cell, nil
  end
  
end
