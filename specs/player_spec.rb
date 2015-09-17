require_relative "../lib/player"
require_relative "../lib/game_play"
require_relative "../lib/winner"
require_relative "input_double"
require "minitest/autorun"

class HumanVsHumanPlayer < MiniTest::Unit::TestCase

  def play(player1, player2)
    game_play = GamePlay.new(player1, player2)
    board = Board.empty
    while game_play.keep_playing?(board)
        game_play.next_move(board)
    end
    Winner.new(board).find
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