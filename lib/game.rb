require_relative "./board_output"
require_relative "./board"
require_relative "./game_play"
require_relative "./game_screens"
require_relative "./winner"

class Game
  
  def initialize(players)
    @game_screens = GameScreens.new(BoardOutput)
    @player1 = players.first
    @player2 = players[1]
  end
  
  def start_game
    board = Board.empty
    @game_screens.game_start(board)
    game_play = GamePlay.new(@player1, @player2)
    while game_play.keep_playing?(board)
      game_play.next_move(board)
      @game_screens.next_move_screen(board)
    end
    winner = find_winner(board)
    if winner
      @game_screens.game_won(board, winner)
    else
      @game_screens.game_over_with_tie(board)
    end
  end
  
  private
  
  def find_winner(board)
    Winner.new(board).find
  end
  
end
