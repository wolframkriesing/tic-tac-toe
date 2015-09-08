require_relative "../lib/game_rules"
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
	game_won = GameRules.new(Boards.top_row_won_by_player1).won?
	assert_equal game_won, true  
  end
	
  def test_bottom_row_occupied_by_player_is_won
	game_won = GameRules.new(Boards.bottom_row_won_by_player1).won?
	assert_equal game_won, true  
  end

  def test_diagonal_from_left_top_occupied_by_player_is_won
	game_won = GameRules.new(Boards.diagonal_from_left_top_won_by_player1).won?
	assert_equal game_won, true  
  end

  def test_diagonal_from_right_top_occupied_by_player_is_won
	game_won = GameRules.new(Boards.diagonal_from_right_top_won_by_player2).won?
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

  def test_won_game_with_full_board_is_not_a_tie
	board = Boards.tie_board
	player1 = Boards.player1
	board[0].occupy_by(player1)
	board[1].occupy_by(player1)
	board[2].occupy_by(player1)
	is_tie = GameRules.new(board).tie?
	assert_equal is_tie, false
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
