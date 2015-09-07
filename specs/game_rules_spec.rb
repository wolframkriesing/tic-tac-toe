require_relative "../lib/game_rules.rb"
require "minitest/autorun"

class Boards
  def self.empty_board
	[
		Cell.new("0"), Cell.new("1"), Cell.new("2"), 
		Cell.new("3"), Cell.new("4"), Cell.new("5"), 
		Cell.new("6"), Cell.new("7"), Cell.new("8"), 
	]
  end
  
  def self.tie_board
	[
		occupied_cell_by("0", "X"), occupied_cell_by("1", "O"), occupied_cell_by("2", "O"), 
		occupied_cell_by("3", "O"), occupied_cell_by("4", "X"), occupied_cell_by("5", "X"), 
		occupied_cell_by("6", "O"), occupied_cell_by("7", "X"), occupied_cell_by("8", "O"), 
	]
  end
  
  private
  
  def self.occupied_cell_by(cell_char, player)
	Cell.new(cell_char).set_to(player)
  end

end

class GameNotOver < MiniTest::Unit::TestCase
	
  def test_no_cell_occupied_game_is_not_over
	game_over = GameRules.new(Boards.empty_board).is_game_over
	assert_equal game_over, false  
  end

end

class Tie < MiniTest::Unit::TestCase
	
  def test_all_cells_occupied_is_tie
	is_tie = GameRules.new(Boards.tie_board).is_tie
	assert_equal is_tie, true
  end

end