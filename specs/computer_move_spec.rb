require_relative "../lib/computer_move.rb"
require_relative "./boards.rb"
require "minitest/autorun"

class MyBoards
  def self.full_board_but_one_cell(cell_index)
	board = Boards.tie_board
	board[cell_index] = Cell.new(cell_index.to_s)
	board
  end
  def self.to_board(s)
	map = {
	  "C" => Boards.player1,
	  "H" => Boards.player2
	}
	board = s.split("").map {|char|
		cell = Cell.new(char) 
		if map[char] != nil
		  cell.set_to(map[char]) 
		end
		cell
	}
	board
  end
end

def computer_move(board)
  move = ComputerMove.new(board, Boards.player1, Boards.player2)
  move.pick_cell
end

class ComputerMoveBase < MiniTest::Unit::TestCase
	
 	def test_can_only_occupy_available_spot
		board = MyBoards.full_board_but_one_cell(4)
		assert_equal computer_move(board), 4
	end
	
 	def test_can_only_occupy_available_spot1
		board = MyBoards.full_board_but_one_cell(0)
		assert_equal computer_move(board), 0
	end
	
 	def test_place_on_cell_4_if_available
		assert_equal computer_move(Boards.empty_board), 4
	end	
	
 	def test_make_computer_win_first
		board = MyBoards.to_board("CC2HH5678")
		assert_equal computer_move(board), 2
	end	
	
 	def test_random_move_when_4_is_occupied
		board = MyBoards.to_board("0123H5678")
		assert_equal computer_move(board) != 4, true
	end	
	
end

class BestMoveToWin < MiniTest::Unit::TestCase
	
 	def test_for_two_in_a_row_get_third
		board = MyBoards.to_board("CC23H5678")
		assert_equal computer_move(board), 2
	end
	
 	def test_for_two_in_a_row_with_a_gap
		board = MyBoards.to_board("C123H5C78")
		assert_equal computer_move(board), 3
	end
	
end


class BlockHumansBestMoveToWin < MiniTest::Unit::TestCase
	
 	def test_block_human_from_winning_with_simple_complete_row
		board = MyBoards.to_board("HH23C5678")
		assert_equal computer_move(board), 2
	end
	
 	def test_block_human_from_winning_with_diagonal
		board = MyBoards.to_board("H12CH5678")
		assert_equal computer_move(board), 8
	end
		
end