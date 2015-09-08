require_relative "./game_rules"
require_relative "./computer_move"
require_relative "./cell"
require_relative "./player"
require_relative "./string"

class GameScreens
  
  def initialize(board_output)
    @board_output = board_output
  end
  
  def clear_screen
    system("clear")
  end
  
  def start_screen(board)
    clear_screen
    puts "Welcome to my Tic Tac Toe game"
    print_board(board)
    puts "Please select your cell."
  end

  def board_screen(board)
    clear_screen
    empty_line
    print_board(board)
  end
  
  def game_over_screen
    puts "Game over"
  end
  
  private
  
  def print_board(board)
    @board_output.print(board)
  end 
  
  def empty_line
    puts
  end
  
end

class Game
  
  def initialize(boardOutput)
    @boardOutput = boardOutput
    @game_screens = GameScreens.new(boardOutput)
    @board = [
      Cell.new, Cell.new, Cell.new,
      Cell.new, Cell.new, Cell.new,
      Cell.new, Cell.new, Cell.new
    ]
    @computer_character = Player.new("X".red)
    @human_character = Player.new("O".green)
  end

  def start_game
    @game_screens.start_screen(@board)
    game_play_loop(@board)
    @game_screens.game_over_screen
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
    move = ComputerMove.new(board, @computer_character, @human_character)
    cell_index = move.pick_cell
    board[cell_index].occupy_by(@computer_character)
  end
  
end

def tie?(board)
  GameRules.new(board).tie?  
end

def won?(board)
  GameRules.new(board).won?  
end
