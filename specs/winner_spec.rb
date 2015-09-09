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

end

require_relative "../lib/game_rules"
class Winner
	
  def initialize(board)
    @board = board
  end
	
  def find
    GameRules.new(@board).won? ? @board[0].player : nil
  end
	
end