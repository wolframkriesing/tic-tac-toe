require_relative "../lib/game.rb"
require "minitest/autorun"

def to_board(chars)
	Board.new(chars.split("").map { |cell| Cell.new(cell) })
end

class ComputerMove < MiniTest::Unit::TestCase
	
 	def test_can_only_occupy_available_spot
		board_with_one_available_spot = to_board("XXXX4XXXX");
		Game.new.computer_move(board_with_one_available_spot)
		
		assert_equal board_with_one_available_spot, to_board("XXXXXXXXX")
	end
	
 	def test_can_only_occupy_available_spot1
		board_with_one_available_spot = to_board("0XXXXXXXX");
		Game.new.computer_move(board_with_one_available_spot)
		
		assert_equal board_with_one_available_spot, to_board("XXXXXXXXX")
	end
	
 	def test_place_on_cell_4_if_available
		board_with_one_available_spot = to_board("012345678");
		Game.new.computer_move(board_with_one_available_spot)
		
		assert_equal board_with_one_available_spot, to_board("0123X5678")
	end	
	
end

class BestMoveToWin < MiniTest::Unit::TestCase
	
 	def test_for_two_in_a_row_get_third
		board_with_one_available_spot = to_board("XX23O5678");
		Game.new.computer_move(board_with_one_available_spot)
		
		assert_equal board_with_one_available_spot, to_board("XXX3O5678")
	end
	
 	def test_for_two_in_a_row_with_a_gap
		board_with_one_available_spot = to_board("X123O5X78");
		Game.new.computer_move(board_with_one_available_spot)
		
		assert_equal board_with_one_available_spot, to_board("X12XO5X78")
	end
	
end


class BlockHumansBestMoveToWin < MiniTest::Unit::TestCase
	
 	def test_block_human_from_winning_with_simple_complete_row
		board_with_one_available_spot = to_board("OO23X5678");
		Game.new.computer_move(board_with_one_available_spot)
		
		assert_equal board_with_one_available_spot, to_board("OOX3X5678")
	end
	
 	def test_block_human_from_winning_with_diagonal
		board_with_one_available_spot = to_board("O12XO5678");
		Game.new.computer_move(board_with_one_available_spot)
		
		assert_equal board_with_one_available_spot, to_board("O12XO567X")
	end
		
end