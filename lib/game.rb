require_relative "game_play"
require_relative "game_screens"

class Game
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
  
  def start_game(board)
    @game_screens = GameScreens.new
    board = game_play(board)
    @game_screens.game_over(board)
  end
  
  private
    
  def game_play(board)
    @game_screens.game_start(board)
    game_play = GamePlay.new(@player1, @player2)
    while !board.game_over?
      until new_board = board_after_valid_move(board, game_play); end
      board = new_board
      @game_screens.next_move_screen(board)
    end
    board
  end
  
  def board_after_valid_move(board, game_play)
    begin
      return game_play.next_move(board)
    rescue InvalidMoveError => err
      @game_screens.invalid_cell(err.picked_cell_index)
    end
  end
  
end
