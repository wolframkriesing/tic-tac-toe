require_relative "./game_rules"
require_relative "./computer_move"
require_relative "./cell"
require_relative "./player"
require_relative "./string"
require_relative "./game_screens"

class Board < Array
	
  def self.empty
    board = Board.new
    board.concat([
      Cell.new, Cell.new, Cell.new,
      Cell.new, Cell.new, Cell.new,
      Cell.new, Cell.new, Cell.new
    ])
    board
  end
	
end

class HumanPlayer < Player
  
  def next_move(board, opponent)
    cell = nil
    until cell
      cell = gets.chomp.to_i
      if board[cell].is_available?
        return cell
      else
        cell = nil
      end
    end
  end
  
end

class ComputerPlayer < Player
  
  def next_move(board, opponent)
    computer_move = ComputerMove.new(board, self, opponent)
    computer_move.pick_cell
  end
  
end

class Game
  
  def initialize(board_output, player1_character, player2_character)
    @board_output = board_output
    @game_screens = GameScreens.new(board_output)
    @player1 = ComputerPlayer.new(player1_character.red)
    @player2 = HumanPlayer.new(player2_character.green)
  end

  def start_game
    board = Board.empty
    @game_screens.game_start(board)
    game_play_loop(board)
    @game_screens.game_over
  end

  def game_play_loop(board)
    @move_count = 0
    while game_on?(board) 
      next_move(board)
    end
  end
  
  def next_move(board)
    whos_turn = @move_count % 2
    if whos_turn == 0
      play_move(board, @player2, @player1)
    else
      play_move(board, @player1, @player2)
    end
  end

  def play_move(board, me, opponent)
    cell_index = me.next_move(board, opponent)
    board[cell_index].occupy_by(me)
    @game_screens.board_screen(board)
    @move_count += 1
  end
  
end

def tie?(board)
  GameRules.new(board).tie?  
end

def won?(board)
  GameRules.new(board).won?  
end

def game_on?(board)
  !GameRules.new(board).game_over?  
end