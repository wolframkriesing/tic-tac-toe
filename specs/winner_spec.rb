require_relative "boards"
require_relative "_helper"
require_relative "../lib/player"
require_relative "input_double"
require "minitest/autorun"

class NoWinner < MiniTest::Unit::TestCase

  def test_empty_board_has_no_winner
    assert_equal Boards.empty_board.find_winner, nil
  end
  
  # rows

  def test_top_row_won_by_player1
    assert_equal Boards.top_row_won_by_player1.find_winner, Boards.player1
  end

  def test_middle_row_won_by_player1
    assert_equal Boards.middle_row_won_by_player1.find_winner, Boards.player1
  end

  def test_bottom_row_won_by_player1
    assert_equal Boards.bottom_row_won_by_player1.find_winner, Boards.player1
  end
  
  # columns
  
  def test_left_column_won
    winner = Boards.left_column_won_by(Boards.player1).find_winner
    assert_equal winner, Boards.player1
  end
  
  def test_middle_column_won
    winner = Boards.middle_column_won_by(Boards.player1).find_winner
    assert_equal winner, Boards.player1
  end
  
  def test_right_column_won
    winner = Boards.right_column_won_by(Boards.player1).find_winner
    assert_equal winner, Boards.player1
  end
  
  # diagonals
  
  def test_diagonal_from_right_top_won_by_player2
    winner = Boards.diagonal_from_right_top_won_by_player2.find_winner
    assert_equal winner, Boards.player2
  end
  
  def test_diagonal_from_left_top_won_by_player1
    winner = Boards.diagonal_from_left_top_won_by_player1.find_winner
    assert_equal winner, Boards.player1
  end

end

class BoardWithTwoRows < MiniTest::Unit::TestCase

  def play(player1, player2)
    TestHelper.play_board_get_winner(Board.new(2), player1, player2)
  end
  
  def test_first_player_wins_with_filled_row
    player1 = HumanPlayer.new("1", MyInput.new("12"))
    player2 = HumanPlayer.new("2", MyInput.new("3"))
    
    assert_equal play(player1, player2), player1
  end
  
  def test_first_player_wins_with_filled_column
    player1 = HumanPlayer.new("1", MyInput.new("13"))
    player2 = HumanPlayer.new("2", MyInput.new("2"))
    
    assert_equal play(player1, player2), player1
  end
  
  def test_first_player_wins_with_filled_diagonal
    player1 = HumanPlayer.new("1", MyInput.new("14"))
    player2 = HumanPlayer.new("2", MyInput.new("2"))
    
    assert_equal play(player1, player2), player1
  end
  
end


class BoardWithFourRows < MiniTest::Unit::TestCase

  def play(player1, player2)
    TestHelper.play_board_get_winner(Board.new(4), player1, player2)
  end
  
  def test_diagonal_wins
    player1 = HumanPlayer.new("1", MyInput.new(["1", "6", "11", "16"]))
    player2 = HumanPlayer.new("2", MyInput.new("234"))
    
    assert_equal play(player1, player2), player1
  end
  
end