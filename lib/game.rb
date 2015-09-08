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

class Game
  
  def initialize(board_output)
    @board_output = board_output
    @game_screens = GameScreens.new(board_output)
    @computer_character = Player.new("X".red)
    @human_character = Player.new("O".green)
  end

  def start_game
    board = Board.empty
    @game_screens.game_start(board)
    game_play_loop(board)
    @game_screens.game_over
  end

  def game_play_loop(board)
    until won?(board) || tie?(board)
      get_human_spot(board)
      if !won?(board) && !tie?(board)
        computer_move(board)
      end
      @game_screens.board_screen(board)
    end
  end
  
  def get_human_spot(board)
    cell = nil
    until cell
      cell = gets.chomp.to_i
      if board[cell].is_available?
        board[cell].occupy_by(@human_character)
      else
        cell = nil
      end
    end
  end

  def computer_move(board)
    computer_move = ComputerMove.new(board, @computer_character, @human_character)
    cell = board[computer_move.pick_cell]
    cell.occupy_by(@computer_character)
  end
  
end

def tie?(board)
  GameRules.new(board).tie?  
end

def won?(board)
  GameRules.new(board).won?  
end
