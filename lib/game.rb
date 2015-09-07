require_relative "./game_rules"
require_relative "./winning_move"
require_relative "./random_move"
require_relative "./cell"
require_relative "./player"

class Game
  
  def initialize(boardOutput)
    @boardOutput = boardOutput
    @board = [
      Cell.new("0"), Cell.new("1"), Cell.new("2"), 
      Cell.new("3"), Cell.new("4"), Cell.new("5"), 
      Cell.new("6"), Cell.new("7"), Cell.new("8")
    ]
    @computer_character = "X"
    @human_character = "O"
  end

  def print_board(board)
    @boardOutput.print(board)
  end 

  def start_game
    system("clear")
    puts "Welcome to my Tic Tac Toe game"
    print_board(@board)
    puts "Please select your cell."
    game_play_loop(@board)
    puts "Game over"
  end

  def game_play_loop(board)
    until won?(board) || tie?(board)
      get_human_spot(board)
      if !won?(board) && !tie?(board)
        computer_move(board)
      end
      system("clear")
      puts
      print_board(@board)
    end
  end
  
  def get_human_spot(board)
    cell = nil
    until cell
      cell = gets.chomp.to_i
      if board[cell].is_available?
        board[cell].set_to(@human_character)
      else
        cell = nil
      end
    end
  end

  def computer_move(board)
    move = ComputerMove.new(board, @computer_character, @human_character)
    cell_index = move.pick_cell
    board[cell_index].set_to(@computer_character)
  end
  
end

def tie?(board)
  GameRules.new(board).tie?  
end

def won?(board)
  GameRules.new(board).won?  
end
