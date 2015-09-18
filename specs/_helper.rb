require_relative "_game_screens_double"
require_relative "../lib/game"

class TestHelper

  def self.play_board_get_winner(board, player1, player2)
    winner_for_board(board, player1, player2)
  end
  
  def self.play_board(board, player1, player2)
    game = Game.new(player1, player2, GameScreensDouble.new)
    game.game_loop(board)
  end
  
  def self.winner_for_board(board, player1, player2)
    play_board(board, player1, player2).find_winner
  end

end