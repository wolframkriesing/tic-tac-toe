require_relative "./board"
require_relative "./game_play"
require_relative "./game_screens"
require_relative "./winner"

class Game
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
  
  def start_game
    game_screens = GameScreens.new
    board = Board.empty
    game_play(board, game_screens)
    game_screens.game_over(board, find_winner(board))
  end
  
  private
    
  def game_play(board, game_screens)
    game_screens.game_start(board)
    game_play = GamePlay.new(@player1, @player2)
    while game_play.keep_playing?(board)
      game_play.next_move(board)
      game_screens.next_move_screen(board)
    end
  end
    
  def find_winner(board)
    Winner.new(board).find
  end
  
end
