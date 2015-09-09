require_relative "./game_rules"
require_relative "./board_output"
require_relative "./cell"
require_relative "./player"
require_relative "./string"
require_relative "./board"
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
    game_play_loop(board)
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
  
  def game_play_loop(board)
    @move_count = 0
    while keep_playing?(board)
      next_move(board)
      @game_screens.next_move_screen(board)
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
    cell_index = pick_valid_cell(board, me, opponent)
    board[cell_index].occupy_by(me)
    @move_count += 1
  end
  
  def pick_valid_cell(board, player, opponent)
    cell_index = nil
    cell_index = player.pick_cell(board, opponent)
    while not board.is_available_cell(cell_index)
      @game_screens.invalid_cell(cell_index)
      cell_index = player.pick_cell(board, opponent)
    end
    cell_index
  end
  
  def keep_playing?(board)
    !GameRules.new(board).game_over?  
  end
  
end
