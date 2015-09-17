require_relative "boards"
require_relative "../lib/winner"
require_relative "../lib/player"
require_relative "../lib/game_play"
require_relative "input_double"
require "minitest/autorun"

def find_winner_for(board)
  Winner.new(board).find
end

class NoWinner < MiniTest::Unit::TestCase

  def test_empty_board_has_no_winner
    winner = find_winner_for(Boards.empty_board)
    assert_equal winner, nil
  end
  
  # rows

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
  
  # columns
  
  def test_left_column_won
    winner = find_winner_for(Boards.left_column_won_by(Boards.player1))
    assert_equal winner, Boards.player1
  end
  
  def test_middle_column_won
    winner = find_winner_for(Boards.middle_column_won_by(Boards.player1))
    assert_equal winner, Boards.player1
  end
  
  def test_right_column_won
    winner = find_winner_for(Boards.right_column_won_by(Boards.player1))
    assert_equal winner, Boards.player1
  end
  
  # diagonals
  
  def test_diagonal_from_right_top_won_by_player2
    winner = find_winner_for(Boards.diagonal_from_right_top_won_by_player2)
    assert_equal winner, Boards.player2
  end
  
  def test_diagonal_from_left_top_won_by_player1
    winner = find_winner_for(Boards.diagonal_from_left_top_won_by_player1)
    assert_equal winner, Boards.player1
  end

end

class BoardWithTwoRows < MiniTest::Unit::TestCase

  def play(player1, player2)
    game_play = GamePlay.new(player1, player2)
    board = Board.new(2)
	  while !board.game_over?
        game_play.next_move(board)
    end
    board.find_winner
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
    game_play = GamePlay.new(player1, player2)
    board = Board.new(4)
    while !board.game_over?
        game_play.next_move(board)
    end
    Winner.new(board).find
  end
  
  def test_diagonal_wins
    player1 = HumanPlayer.new("1", MyInput.new(["1", "6", "11", "16"]))
    player2 = HumanPlayer.new("2", MyInput.new("234"))
    
    assert_equal play(player1, player2), player1
  end
  
end