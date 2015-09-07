require_relative "../lib/winning_move"
require_relative "../lib/cell"
require_relative "./boards"
require "minitest/autorun"

class MyBoards < Boards
  
  def self.fill_cell_0_to_win(player)
	[
		Cell.new("0"), occupied_cell_by("1", player), occupied_cell_by("2", player),
		Cell.new("3"), Cell.new("4"), Cell.new("5"), 
		Cell.new("6"), Cell.new("7"), Cell.new("8"), 
	]
  end
  
  private 
  
  def self.occupied_cell_by(x,y)
	Boards.occupied_cell_by(x,y)
  end
	 
end

class SafteyNetTest < MiniTest::Unit::TestCase
	
  def test_dont_modify_given_board
    # for lack of ruby skills, i was trapped by this :)
    board = Boards.empty_board
	  cell = WinningMove.new.calculate_cell(board, "X", "O")
    assert_equal board, Boards.empty_board
  end
  
end 
  
class WinningMoveTest < MiniTest::Unit::TestCase
	
  def test_for_an_empty_board_there_is_none
	  cell = WinningMove.new.calculate_cell(Boards.empty_board, "X", "O")
	  assert_equal cell, nil
  end
  
  def test_fill_cell_0_to_win_for_player_1
	  cell = WinningMove.new.calculate_cell(MyBoards.fill_cell_0_to_win("X"), "X", "O")
	  assert_equal cell, 0
  end
  
  def test_fill_cell_0_to_win_for_player_2
	  cell = WinningMove.new.calculate_cell(MyBoards.fill_cell_0_to_win("O"), "X", "O")
	  assert_equal cell, 0
  end
  
end
