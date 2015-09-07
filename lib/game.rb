require_relative "./game_rules"
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
    until is_won(board) || tie(board)
      get_human_spot(board)
      if !is_won(board) && !tie(board)
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
  
  def would_win(board, cell_index, character)
    possible_board = [].concat(board)
    possible_board[cell_index] = character
    is_won(possible_board)
  end
  
  def would_computer_win(board, cell_index)
    would_win(board, cell_index, @computer_character)
  end

  def would_human_win(board, cell_index)
    would_win(board, cell_index, @human_character)
  end

  def is_winning_move(board, cell_index)
    would_computer_win(board, cell_index) or would_human_win(board, cell_index)
  end

  def winning_move(board, available_cells_indexes)
    cells_that_would_make_a_win = available_cells_indexes.select { |cell_index| 
      is_winning_move(board, cell_index) 
    }
    cells_that_would_make_a_win.first
  end
  
  def get_best_move(board)
    available_cells_indexes = all_available_cells_indexes(board)
    cell_for_winning_move = winning_move(board, available_cells_indexes)
    if cell_for_winning_move
      return cell_for_winning_move
    end
    random_move(available_cells_indexes)    
  end
  
end

def random_move(available_cells_indexes) 
  n = rand(0..available_cells_indexes.count)
  available_cells_indexes[n].to_i
end

def tie(board)
  board.all? { |cell| cell == "X" || cell == "O" }
end

def is_won(board)
  GameRules.new(board).is_won  
end
