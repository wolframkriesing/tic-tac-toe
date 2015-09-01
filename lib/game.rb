class Game
  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @computer_character = "X"
    @human_character = "O"
  end

  def start_game
    puts "Welcome to my Tic Tac Toe game"
    print_board(@board)
    puts "Please select your spot."
    game_play_loop(@board)
    puts "Game over"
  end

  def print_board(board)
    puts "|_#{board[0]}_|_#{board[1]}_|_#{board[2]}_|\n|_#{board[3]}_|_#{board[4]}_|_#{board[5]}_|\n|_#{board[6]}_|_#{board[7]}_|_#{board[8]}_|\n"
  end

  def game_play_loop(board)
    until game_is_over(board) || tie(board)
      get_human_spot(board)
      if !game_is_over(board) && !tie(board)
        eval_board(board)
      end
      print_board(board)
    end
  end

  def get_human_spot(board)
    spot = nil
    until spot
      spot = gets.chomp.to_i
      if board[spot] != "X" && board[spot] != "O"
        board[spot] = @human_character
      else
        spot = nil
      end
    end
  end

  def eval_board(board)
    spot = nil
    until spot
      if board[4] == "4"
        spot = 4
        board[spot] = @computer_character
      else
        spot = get_best_move(board, @computer_character)
        if board[spot] != "X" && board[spot] != "O"
          board[spot] = @computer_character
        else
          spot = nil
        end
      end
    end
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    available_spaces = []
    best_move = nil
    board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
    available_spaces.each do |as|
      board[as.to_i] = @computer_character
      if game_is_over(board)
        best_move = as.to_i
        board[as.to_i] = as
        return best_move
      else
        board[as.to_i] = @human_character
        if game_is_over(board)
          best_move = as.to_i
          board[as.to_i] = as
          return best_move
        else
          board[as.to_i] = as
        end
      end
    end
    if best_move
      return best_move
    else
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
  end

  def game_is_over(b)

    [b[0], b[1], b[2]].uniq.length == 1 ||
    [b[3], b[4], b[5]].uniq.length == 1 ||
    [b[6], b[7], b[8]].uniq.length == 1 ||
    [b[0], b[3], b[6]].uniq.length == 1 ||
    [b[1], b[4], b[7]].uniq.length == 1 ||
    [b[2], b[5], b[8]].uniq.length == 1 ||
    [b[0], b[4], b[8]].uniq.length == 1 ||
    [b[2], b[4], b[6]].uniq.length == 1
  end

  def tie(b)
    b.all? { |s| s == "X" || s == "O" }
  end

end

game = Game.new
game.start_game
