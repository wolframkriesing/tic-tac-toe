require_relative "../lib/game_play"

class TestHelper

  def self.play_board_get_winner(board, player1, player2)
    winner_for_board(board, player1, player2)
  end
  
  def self.play_board(board, player1, player2)
    game_play = GamePlay.new(player1, player2)
	  while !board.game_over?
      board = game_play.next_move(board)
    end
    board
  end
  
  def self.winner_for_board(board, player1, player2)
    play_board(board, player1, player2).find_winner
  end

end