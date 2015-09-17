require "minitest/autorun"
require_relative "../lib/board"

class DefaultBoardTests < MiniTest::Unit::TestCase

  def empty_board
	  board = Board.empty
  end

  def test_board_has_9_cells
	  assert_equal empty_board.cells.length, 9
  end
  
  def test_board_has_3_rows
  	assert_equal empty_board.rows_count, 3
  end
  
end

class BoardTests < MiniTest::Unit::TestCase

  def test_board_with_2_rows
    board = Board.new 2
    assert_equal board.cells.length, 4
  end
  
end

class GameNotWon < MiniTest::Unit::TestCase
	
  def test_no_cell_occupied_game_is_not_won
	  assert_equal Boards.empty_board.won?, false  
  end
	
  def test_tie_game_is_not_won
	  assert_equal Boards.tie_board.won?, false  
  end

end

class GameWon < MiniTest::Unit::TestCase
	
  def test_top_row_occupied_by_player_is_won
	  assert_equal Boards.top_row_won_by_player1.won?, true  
  end
	
  def test_bottom_row_occupied_by_player_is_won
	  assert_equal Boards.bottom_row_won_by_player1.won?, true  
  end

  def test_diagonal_from_left_top_occupied_by_player_is_won
	  assert_equal Boards.diagonal_from_left_top_won_by_player1.won?, true  
  end

  def test_diagonal_from_right_top_occupied_by_player_is_won
	  assert_equal Boards.diagonal_from_right_top_won_by_player2.won?, true  
  end

end

class Tie < MiniTest::Unit::TestCase

  def test_no_cell_occupied_game_is_not_tie
	  assert_equal Boards.empty_board.tie?, false  
  end

  def test_all_cells_occupied_is_tie
	  assert_equal Boards.tie_board.tie?, true
  end

  def test_won_game_with_full_board_is_not_a_tie
    player1 = Boards.player1
    board = Boards.tie_board
      .make_move_to(0, player1)
      .make_move_to(1, player1)
      .make_move_to(2, player1)
    assert_equal board.tie?, false
  end

end

class GameOver < MiniTest::Unit::TestCase

  def test_no_cell_occupied_game_is_not_over
	 assert_equal Boards.empty_board.game_over?, false  
  end

  def test_tie_board_is_game_over
  	assert_equal Boards.tie_board.game_over?, true
  end

end
