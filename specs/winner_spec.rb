require_relative "./boards"
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

require_relative "../lib/game_rules"
class Winner
	
  def initialize(board)
    @board = board
  end
	
  def find
    if cells_equal?(6, 7, 8)
      return @board[6].player
    end
    if cells_equal?(3, 4, 5)
      return @board[3].player
    end
    if cells_equal?(0, 1, 2) or cells_equal?(0, 4, 8) 
      return @board[0].player
    end
    if cells_equal?(2, 4, 6)
      return @board[2].player
    end
  end
  
  def cells_equal?(cell1, cell2, cell3)
    @board[cell1].owned_by_same_player?(@board[cell2]) && 
    @board[cell2].owned_by_same_player?(@board[cell3])
  end

	
end