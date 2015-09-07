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
  
  def self.top_row_won_by(player)
	[
		occupied_cell_by("0", player), occupied_cell_by("1", player), occupied_cell_by("2", player),
		Cell.new("3"), Cell.new("4"), Cell.new("5"), 
		Cell.new("6"), Cell.new("7"), Cell.new("8"), 
	]
  end
  
  def self.diagonal_from_left_top_won_by(player)
	[
		occupied_cell_by("0", player), Cell.new("1"), Cell.new("2"),
		Cell.new("3"), occupied_cell_by("4", player), Cell.new("5"), 
		Cell.new("6"), Cell.new("7"), occupied_cell_by("8", player), 
	]
  end
  
  def self.diagonal_from_right_top_won_by(player)
	[
		Cell.new("0"), Cell.new("1"), occupied_cell_by("2", player),
		Cell.new("3"), occupied_cell_by("4", player), Cell.new("5"), 
		occupied_cell_by("6", player), Cell.new("7"), Cell.new("8") 
	]
  end
  
  private
  
  def self.occupied_cell_by(cell_char, player)
	Cell.new(cell_char).set_to(player)
  end

end

class GameNotWon < MiniTest::Unit::TestCase
	
  def test_no_cell_occupied_game_is_not_won
	game_won = GameRules.new(Boards.empty_board).won?
	assert_equal game_won, false  
  end
	
  def test_tie_game_is_not_won
	game_won = GameRules.new(Boards.tie_board).won?
	assert_equal game_won, false  
  end

end

class GameWon < MiniTest::Unit::TestCase
	
  def test_top_row_occupied_by_player_is_won
	game_won = GameRules.new(Boards.top_row_won_by("X")).won?
	assert_equal game_won, true  
  end

  def test_diagonal_from_left_top_occupied_by_player_is_won
	game_won = GameRules.new(Boards.diagonal_from_left_top_won_by("X")).won?
	assert_equal game_won, true  
  end

  def test_diagonal_from_right_top_occupied_by_player_is_won
	game_won = GameRules.new(Boards.diagonal_from_right_top_won_by("O")).won?
	assert_equal game_won, true  
  end

end

class Tie < MiniTest::Unit::TestCase

  def test_no_cell_occupied_game_is_not_tie
	is_tie = GameRules.new(Boards.empty_board).tie?
	assert_equal is_tie, false  
  end

  def test_all_cells_occupied_is_tie
	is_tie = GameRules.new(Boards.tie_board).tie?
	assert_equal is_tie, true
  end

end

class GameOver < MiniTest::Unit::TestCase

  def test_no_cell_occupied_game_is_not_over
	is_over = GameRules.new(Boards.empty_board).game_over?
	assert_equal is_over, false  
  end

  def test_tie_board_is_game_over
	is_over = GameRules.new(Boards.tie_board).game_over?
	assert_equal is_over, true
  end

end

