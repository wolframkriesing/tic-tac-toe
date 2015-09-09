require_relative "./game_rules"
require_relative "./board_output"
require_relative "./cell"
require_relative "./player"
require_relative "./string"
require_relative "./board"
require_relative "./game_screens"

class Game
  
  def initialize(players)
    @game_screens = GameScreens.new(BoardOutput)
    @player1 = players.first
    @player2 = players[1]
  end
  
  def start_game
    board = Board.empty
    @game_screens.game_start(board)
    game_play_loop(board)
    @game_screens.game_over
  end
  
  private
  
  def game_play_loop(board)
    @move_count = 0
    while keep_playing?(board) 
      next_move(board)
    end
  end
  
  def next_move(board)
    whos_turn = @move_count % 2
    if whos_turn == 0
      play_move(board, @player1, @player2)
    else
      play_move(board, @player2, @player1)
    end
  end

  def play_move(board, me, opponent)
    cell_index = me.pick_cell(board, opponent)
    board[cell_index].occupy_by(me)
    @game_screens.board_screen(board)
    @move_count += 1
  end
  
  def keep_playing?(board)
    !GameRules.new(board).game_over?  
  end
  
end
