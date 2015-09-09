require_relative "./game_rules"
require_relative "./cell"
require_relative "./player"
require_relative "./string"
require_relative "./board"
require_relative "./game_screens"

class Game
  
  def initialize(board_output, player1_character, player2_character)
    @board_output = board_output
    @game_screens = GameScreens.new(board_output)
    # computer_vs_human(player1_character.red, player2_character.green)
    # human_vs_computer(player1_character.red, player2_character.green)
    # human_vs_human(player1_character.red, player2_character.green)
    computer_vs_computer(player1_character.red, player2_character.green)
  end

  def start_game
    board = Board.empty
    @game_screens.game_start(board)
    game_play_loop(board)
    @game_screens.game_over
  end
  
  private
  
  def computer_vs_human(player1_character, player2_character)
    @player1 = ComputerPlayer.new(player1_character)
    @player2 = HumanPlayer.new(player2_character)
  end
  
  def human_vs_computer(player1_character, player2_character)
    @player1 = HumanPlayer.new(player1_character)
    @player2 = ComputerPlayer.new(player2_character)
  end

  def human_vs_human(player1_character, player2_character)
    @player1 = HumanPlayer.new(player1_character)
    @player2 = HumanPlayer.new(player2_character)
  end

  def computer_vs_computer(player1_character, player2_character)
    @player1 = ComputerPlayer.new(player1_character)
    @player2 = ComputerPlayer.new(player2_character)
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
      play_move(board, @player1, @player2)
    else
      play_move(board, @player2, @player1)
    end
  end

  def play_move(board, me, opponent)
    cell_index = me.pick_cell(board, opponent)
    board[cell_index].occupy_by(me)
    @game_screens.board_screen(board)
    @move_count += 1
  end
  
end

def game_on?(board)
  !GameRules.new(board).game_over?  
end