require_relative "../lib/game.rb"
require "minitest/autorun"

class ComputerMove < MiniTest::Unit::TestCase
	
 	def test_can_only_occupy_available_spot
		board_with_one_available_spot = "XXXX4XXXX".split("");
		Game.new.computer_move(board_with_one_available_spot)
		
		assert_equal board_with_one_available_spot, "XXXXXXXXX".split("")
	end
	
 	def test_can_only_occupy_available_spot1
		board_with_one_available_spot = "0XXXXXXXX".split("");
		Game.new.computer_move(board_with_one_available_spot)
		
		assert_equal board_with_one_available_spot, "XXXXXXXXX".split("")
	end
	
 	def test_place_on_cell_4_if_available
		board_with_one_available_spot = "012345678".split("");
		Game.new.computer_move(board_with_one_available_spot)
		
		assert_equal board_with_one_available_spot, "0123X5678".split("")
	end	
	
end

class BestMoveToWin < MiniTest::Unit::TestCase
	
 	def test_for_two_in_a_row_get_third
		board_with_one_available_spot = "XX23O5678".split("");
		Game.new.computer_move(board_with_one_available_spot)
		
		assert_equal board_with_one_available_spot, "XXX3O5678".split("")
	end
	
 	def test_for_two_in_a_row_with_a_gap
		board_with_one_available_spot = "X123O5X78".split("");
		Game.new.computer_move(board_with_one_available_spot)
		
		assert_equal board_with_one_available_spot, "X12XO5X78".split("")
	end
	
end


class BlockHumansBestMoveToWin < MiniTest::Unit::TestCase
	
 	def test_block_human_from_winning_with_simple_complete_row
		board_with_one_available_spot = "OO23X5678".split("");
		Game.new.computer_move(board_with_one_available_spot)
		
		assert_equal board_with_one_available_spot, "OOX3X5678".split("")
	end
	
 	def test_block_human_from_winning_with_diagonal
		board_with_one_available_spot = "O12XO5678".split("");
		Game.new.computer_move(board_with_one_available_spot)
		
		assert_equal board_with_one_available_spot, "O12XO567X".split("")
	end
		
end