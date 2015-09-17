require_relative "player"
require_relative "computer_move"

class Opponents

  HUMAN_VS_COMPUTER = 0
  COMPUTER_VS_HUMAN = 1
  HUMAN_VS_HUMAN = 2
  COMPUTER_VS_COMPUTER = 3
  
  DIFFICULTY_EASY = 0
  DIFFICULTY_MEDIUM = 1
  DIFFICULTY_HARD = 2
    
  def initialize(game_type=HUMAN_VS_COMPUTER, difficulty=DIFFICULTY_MEDIUM)
    @game_type = game_type
    @difficulty = difficulty
  end
	
  def player1(character)
    player = HumanPlayer.new(character)
    if player1_is_a_computer?
      player = computer_player(character)
    end
    player.set_color(Colorize::GREEN)
    player
  end
  
  def player2(character)
    player = HumanPlayer.new(character)
    if player2_is_a_computer?
      player = computer_player(character)
    end
    player.set_color(Colorize::RED)
    player
  end
  
  private
  
  def computer_player(character)
    computer_move_class = {
      DIFFICULTY_EASY => ComputerMoveEasy,
      DIFFICULTY_MEDIUM => ComputerMoveMedium,
      DIFFICULTY_HARD => ComputerMoveHard,
    }

    player = ComputerPlayer.new(character)
    player.set_move_class(computer_move_class[@difficulty])
    player
  end
  
  def player1_is_a_computer?
	  @game_type == COMPUTER_VS_COMPUTER or @game_type == COMPUTER_VS_HUMAN
  end
  
  def player2_is_a_computer?
	  @game_type == COMPUTER_VS_COMPUTER or @game_type == HUMAN_VS_COMPUTER
  end
  
end