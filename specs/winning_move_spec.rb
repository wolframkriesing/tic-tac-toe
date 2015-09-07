require_relative "../lib/winning_move"
require_relative "../lib/cell"
require_relative "./boards"
require "minitest/autorun"

class WinningMoveTest < MiniTest::Unit::TestCase
	
  def test_for_an_empty_board_there_is_none
	  cell = WinningMove.new(Boards.empty_board).calculate_cell_for_win(Boards.player1)
	  assert_equal cell, nil
  end
  
  def test_fill_cell_0_to_win_for_player_1
	  cell = WinningMove.new(Boards.fill_cell_0_to_win(Boards.player1)).calculate_cell_for_win(Boards.player1)
	  assert_equal cell, 0
  end
  
  def test_fill_cell_0_to_win_for_player_2
	  cell = WinningMove.new(Boards.fill_cell_0_to_win(Boards.player2)).calculate_cell_for_win(Boards.player2)
	  assert_equal cell, 0
  end
  
end
