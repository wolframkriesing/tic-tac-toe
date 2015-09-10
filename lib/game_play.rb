require_relative "./game_rules"

class GamePlay
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @move_count = 0
  end
  
  def next_move(board)
    whos_turn = @move_count % 2
    if whos_turn == 0
      play_move(board, @player1, @player2)
    else
      play_move(board, @player2, @player1)
    end
  end
  
  def keep_playing?(board)
    !GameRules.new(board).game_over?  
  end
  
  private
  
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
  
end
