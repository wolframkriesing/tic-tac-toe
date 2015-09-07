require_relative "../lib/game.rb"
require "minitest/autorun"

def to_board(chars)
	chars.split("").map do |char|
		index = chars.index(char).to_s
		cell = Cell.new(index) 
		unless char.to_i.to_s == char
			cell.set_to(char)
		end 
		cell
	end
end

class BoardOutput
	def self.print
	end
end
def create_game
	Game.new(BoardOutput)
end

class ComputerMove < MiniTest::Unit::TestCase
	
 	def test_can_only_occupy_available_spot
		board = to_board("XXXX4XXXX");
		create_game().computer_move(board)
		
		assert_equal board, to_board("XXXXXXXXX")
	end
	
 	def test_can_only_occupy_available_spot1
		board = to_board("0XXXXXXXX")
		create_game().computer_move(board)
		
		assert_equal board, to_board("XXXXXXXXX")
	end
	
 	def test_can_only_occupy_available_spot12
		board = to_board("0XXXXXXXX");
		cell = create_game().get_best_move(board)
		
		assert_equal cell, 0
	end
	
 	def test_place_on_cell_4_if_available
		board = to_board("012345678");
		create_game().computer_move(board)
		
		assert_equal board, to_board("0123X5678")
	end	
	
 	def test_make_computer_win_first
		board = to_board("OO2XX5678");
		create_game().computer_move(board)
		
		assert_equal board, to_board("OO2XXX678")
	end	
	
end

class BestMoveToWin < MiniTest::Unit::TestCase
	
 	def test_for_two_in_a_row_get_third
		board = to_board("XX23O5678");
		cell = create_game().get_best_move(board)
		
		assert_equal cell, 2
	end
	
 	def test_for_two_in_a_row_with_a_gap
		board = to_board("X123O5X78");
		cell = create_game().get_best_move(board)
		
		assert_equal cell, 3
	end
	
end


class BlockHumansBestMoveToWin < MiniTest::Unit::TestCase
	
 	def test_block_human_from_winning_with_simple_complete_row
		board = to_board("OO23X5678");
		cell = create_game().get_best_move(board)
		
		assert_equal cell, 2
	end
	
 	def test_block_human_from_winning_with_diagonal
		board = to_board("O12XO5678");
		cell = create_game().get_best_move(board)
		
		assert_equal cell, 8
	end
		
end