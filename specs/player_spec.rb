require_relative "_helper"
require_relative "_input_double"
require_relative "../lib/player"
require "minitest/autorun"

class HumanVsHumanPlayer < MiniTest::Unit::TestCase

  def play(player1, player2)
    TestHelper.winner_for_board(Board.empty, player1, player2)
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

class HumanPlayerTests < MiniTest::Unit::TestCase

  def test_numeric_input_is_returned_as_number_minus_one
    player = HumanPlayer.new("1", MyInput.new(["19"]))
    
    assert_equal player.pick_cell(Board.empty), 18
  end

  def test_non_numeric_input_is_returned_as_is
    player = HumanPlayer.new("1", MyInput.new(["A"]))
    
    assert_equal player.pick_cell(Board.empty), "A"
  end
end