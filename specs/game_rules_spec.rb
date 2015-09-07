require_relative "./boards"
require "minitest/autorun"

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

