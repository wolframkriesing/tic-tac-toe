require_relative "./game_rules"

class GamePlay
  
  def initialize(player1, player2)
    @players = [player1, player2]
  end
  
  def next_move(board)
    play_move(board, @players[0], @players[1])
    flip_players_array
  end
  
  def keep_playing?(board)
    !GameRules.new(board).game_over?  
  end
  
  private
  
  def flip_players_array
    @players[1], @players[0] = @players[0], @players[1]
  end
  
  def play_move(board, player, opponent)
    cell_index = pick_valid_cell(board, player, opponent)
    board.make_move_to(cell_index, player)
  end
  
  def pick_valid_cell(board, player, opponent)
    cell_index = player.pick_cell(board, opponent)
    if not board.is_available_cell(cell_index)
      raise InvalidMoveError.new(cell_index)
    end
    cell_index
  end
  
end

class InvalidMoveError < RuntimeError
  
  attr_reader :picked_cell_index
  def initialize(cell_index)
    @picked_cell_index = cell_index
  end
  
end