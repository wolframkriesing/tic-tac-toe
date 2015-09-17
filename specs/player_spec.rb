require_relative "_helper"
require_relative "../lib/player"
require_relative "input_double"
require "minitest/autorun"

class HumanVsHumanPlayer < MiniTest::Unit::TestCase

  def play(player1, player2)
    TestHelper.play_board_get_winner(Board.empty, player1, player2)
  end

  def test_first_human_wins
    player1 = HumanPlayer.new("1", MyInput.new("123"))
    player2 = HumanPlayer.new("2", MyInput.new("456"))
    
    assert_equal play(player1, player2), player1
  end

  def test_tie
    player1 = HumanPlayer.new("1", MyInput.new("53948"))
    player2 = HumanPlayer.new("2", MyInput.new("1762"))
    
    assert_equal play(player1, player2), nil
  end  
  
end