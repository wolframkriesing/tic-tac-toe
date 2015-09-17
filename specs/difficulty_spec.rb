require_relative "../lib/opponents"
require_relative "../lib/game_play"
require_relative "../lib/board"
require "minitest/autorun"

class UnbeatableComputersPlayingEachOther < MiniTest::Unit::TestCase

  def play
	opponents = Opponents.new(Opponents::COMPUTER_VS_COMPUTER, Opponents::DIFFICULTY_HARD)
	game_play = GamePlay.new(opponents.player1(""), opponents.player2(""))
	board = Board.empty
	while !board.game_over?
      game_play.next_move(board)
	end
	board.tie?
  end
	
  def test_two_computers_play_hard_no_win_possible
	all_ties = []
	100.times do
	  all_ties.push(play) 
	end
	  
	assert_equal all_ties.uniq.length, 1
  end

end


class MediumDifficultyComputerVsComputer < MiniTest::Unit::TestCase

  def play
	opponents = Opponents.new(Opponents::COMPUTER_VS_COMPUTER, Opponents::DIFFICULTY_MEDIUM)
	game_play = GamePlay.new(opponents.player1(""), opponents.player2(""))
	board = Board.empty
	while !board.game_over?
      game_play.next_move(board)
	end
	board.tie?
  end
	
  def test_two_computers_should_have_wins_and_ties
	all_ties = []
	100.times do
	  all_ties.push(play) 
	end
	  
	assert_equal all_ties.uniq.length, 2
  end

end