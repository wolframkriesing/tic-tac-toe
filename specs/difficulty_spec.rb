require_relative "_helper"
require_relative "../lib/game_config"
require_relative "../lib/board"
require "minitest/autorun"

class UnbeatableComputersPlayingEachOther < MiniTest::Unit::TestCase

  def play
	game_config = GameConfig.new(GameConfig::COMPUTER_VS_COMPUTER, GameConfig::DIFFICULTY_HARD)
	TestHelper.play_board(Board.empty, game_config.player1(""), game_config.player2("")).tie?
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
	game_config = GameConfig.new(GameConfig::COMPUTER_VS_COMPUTER, GameConfig::DIFFICULTY_MEDIUM)
	TestHelper.play_board(Board.empty, game_config.player1(""), game_config.player2("")).tie?
  end
	
  def test_two_computers_should_have_wins_and_ties
	all_ties = []
	100.times do
	  all_ties.push(play) 
	end
	  
	assert_equal all_ties.uniq.length, 2
  end

end