require_relative "../lib/computer_move"
require_relative "boards"
require "minitest/autorun"

def string_to_board(str)
  Boards.to_board(str)
end

def easy_computer_move(board)
  move = ComputerMoveEasy.new(board, Boards.player1, Boards.player2)
  move.pick_cell
end

def medium_computer_move(board)
  move = ComputerMoveMedium.new(board, Boards.player1, Boards.player2)
  move.pick_cell
end

def hard_computer_move(board)
  move = ComputerMoveHard.new(board, Boards.player1, Boards.player2)
  move.pick_cell
end

class ComputerMoveEasyTests < MiniTest::Unit::TestCase
  
  def test_pick_one_of_the_emtpy_cells
    board = Board.empty
    assert_equal (0..8) === easy_computer_move(board), true
  end

  def test_can_only_occupy_available_spot
    board = Boards.one_cell_empty(4)
    assert_equal easy_computer_move(board), 4
  end

  def test_can_only_occupy_available_spot1
    board = Boards.one_cell_empty(0)
    assert_equal easy_computer_move(board), 0
  end
  
end

class ComputerMoveMediumTests < MiniTest::Unit::TestCase
  
  def test_first_place_on_cell_4_if_available
  	assert_equal medium_computer_move(Boards.empty_board), 4
  end	

  def test_make_computer_win_first
    board = string_to_board("CC2HH5678")
    assert_equal medium_computer_move(board), 2
  end	

  def test_random_move_when_4_is_occupied
    board = string_to_board("0123H5678")
    assert_equal medium_computer_move(board) != 4, true
  end	
	
end

class BestMoveToWin < MiniTest::Unit::TestCase
	
  def test_for_two_in_a_row_get_third
    board = string_to_board("CC23H5678")
    assert_equal medium_computer_move(board), 2
  end
	
  def test_for_two_in_a_row_with_a_gap
    board = string_to_board("C123H5C78")
    assert_equal medium_computer_move(board), 3
  end
	
end

class BlockHumansBestMoveToWin < MiniTest::Unit::TestCase
	
  def test_block_human_from_winning_with_simple_complete_row
    board = string_to_board("HH23C5678")
    assert_equal medium_computer_move(board), 2
  end
	
  def test_block_human_from_winning_with_diagonal
    board = string_to_board("H12CH5678")
    assert_equal medium_computer_move(board), 8
  end
		
end

class UnbeatableComputer < MiniTest::Unit::TestCase
	
  def test_occupies_corners_first
    board = string_to_board("0123H5678")
    assert_equal hard_computer_move(board), 0
  end
	
  def test_occupies_corners_first_right
    board = string_to_board("H123H567C")
    assert_equal hard_computer_move(board), 2
  end
		
end

class WinningMoveTest < MiniTest::Unit::TestCase
	
  def test_for_an_empty_board_there_is_none
	  cell = CellPicker.new(Boards.empty_board, Boards.player1, Boards.player2).winning_move
	  assert_equal cell, nil
  end
  
  def test_fill_cell_0_to_win_for_player_1
	  cell = CellPicker.new(Boards.fill_cell_0_to_win(Boards.player1), Boards.player1, Boards.player2).winning_move
	  assert_equal cell, 0
  end
  
  def test_fill_cell_0_to_win_for_player_2
	  cell = CellPicker.new(Boards.fill_cell_0_to_win(Boards.player2), Boards.player2, Boards.player1).winning_move
	  assert_equal cell, 0
  end
  
end
