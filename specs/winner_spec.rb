require_relative "./boards"
require_relative "../lib/winner"
require "minitest/autorun"

def find_winner_for(board)
  Winner.new(board).find
end

class NoWinner < MiniTest::Unit::TestCase

  def test_empty_board_has_no_winner
    winner = find_winner_for(Boards.empty_board)
    assert_equal winner, nil
  end

  def test_top_row_won_by_player1
    winner = find_winner_for(Boards.top_row_won_by_player1)
    assert_equal winner, Boards.player1
  end

  def test_middle_row_won_by_player1
    winner = find_winner_for(Boards.middle_row_won_by_player1)
    assert_equal winner, Boards.player1
  end

  def test_bottom_row_won_by_player1
    winner = find_winner_for(Boards.bottom_row_won_by_player1)
    assert_equal winner, Boards.player1
  end
  
  def test_diagonal_from_right_top_won_by_player2
    winner = find_winner_for(Boards.diagonal_from_right_top_won_by_player2)
    assert_equal winner, Boards.player2
  end
  
  def test_diagonal_from_left_top_won_by_player1
    winner = find_winner_for(Boards.diagonal_from_left_top_won_by_player1)
    assert_equal winner, Boards.player1
  end

end
