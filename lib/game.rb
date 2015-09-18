require_relative "game_play"
require_relative "game_screens"

class Game
  
  def initialize(player1, player2, game_screens)
    @player1 = player1
    @player2 = player2
    @game_screens = game_screens
  end
  
  def start_game(board)
    @game_screens.game_start(board)
    board = game_loop(board)
    @game_screens.game_over(board)
  end
  
  def game_loop(board)
    game_play = GamePlay.new(@player1, @player2)
    while !board.game_over?
      board = play_one_move(board, game_play)
    end
    board
  end
  
  private
    
  def play_one_move(board, game_play)
    until new_board = board_after_valid_move(board, game_play); end
    @game_screens.next_move_screen(new_board)
    new_board
  end
  
  def board_after_valid_move(board, game_play)
    begin
      return game_play.next_move(board)
    rescue InvalidMoveError => err
      @game_screens.invalid_cell(err.picked_cell_index)
      return nil
    end
  end
  
end
