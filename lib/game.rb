require_relative "./board"
require_relative "./game_play"
require_relative "./game_screens"

class Game
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
  
  def start_game
    @game_screens = GameScreens.new
    board = Board.empty
    game_play(board)
    @game_screens.game_over(board)
  end
  
  private
    
  def game_play(board)
    @game_screens.game_start(board)
    game_play = GamePlay.new(@player1, @player2)
    while game_play.keep_playing?(board)
      until valid_move(board, game_play)
      end
      @game_screens.next_move_screen(board)
    end
  end
  
  def valid_move(board, game_play)
    begin
      game_play.next_move(board)
      return true
    rescue InvalidMoveError => err
      @game_screens.invalid_cell(err.picked_cell_index) 
      return false
    end
  end
  
end
