require_relative "./game_rules"
require_relative "./winning_move"
require_relative "./cell"

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
    cell = nil
    until cell
      if board[4].is_available?
        cell = 4
        board[cell].set_to(@computer_character)
      else
        cell = get_best_move(board)
        if board[cell].is_available?
          board[cell].set_to(@computer_character)
        else
          cell = nil
        end
      end
    end
  end
  
  def all_available_cells_indexes(board)
    available_cells_indexes = board.select { |cell| cell.is_available? }
    available_cells_indexes.map { |cell| cell.to_i }
  end

  def get_best_move(board)
    winning_move = WinningMove.new(board)
    winning_move.would_player_win?(@computer_character) ||
    winning_move.would_player_win?(@human_character) ||
    random_move(all_available_cells_indexes(board))
  end
  
end

def random_move(available_cells_indexes) 
  n = rand(0..available_cells_indexes.count)
  available_cells_indexes[n].to_i
end

def tie?(board)
  GameRules.new(board).tie?  
end

def won?(board)
  GameRules.new(board).won?  
end
