require 'set'
require_relative "player"
require_relative "computer_move"

class GameConfig

  HUMAN_VS_COMPUTER = 0
  COMPUTER_VS_HUMAN = 1
  HUMAN_VS_HUMAN = 2
  COMPUTER_VS_COMPUTER = 3
  
  PLAYER1_IS_COMPUTER = Set.new [COMPUTER_VS_HUMAN, COMPUTER_VS_COMPUTER]
  PLAYER2_IS_COMPUTER = Set.new [HUMAN_VS_COMPUTER, COMPUTER_VS_COMPUTER]
  
  DIFFICULTY_EASY = 0
  DIFFICULTY_MEDIUM = 1
  DIFFICULTY_HARD = 2
  
  COMPUTER_MOVE_CLASSES = {
    DIFFICULTY_EASY => ComputerMoveEasy,
    DIFFICULTY_MEDIUM => ComputerMoveMedium,
    DIFFICULTY_HARD => ComputerMoveHard,
  }
    
  def initialize(game_type = HUMAN_VS_COMPUTER, difficulty = DIFFICULTY_MEDIUM)
    @game_type = game_type
    @difficulty = difficulty
  end
	
  def player1(character)
    is_computer = PLAYER1_IS_COMPUTER.include?(@game_type)
    player = player_instance(is_computer, character)
    player.set_color(Colorize::GREEN)
    player
  end
  
  def player2(character)
    is_computer = PLAYER2_IS_COMPUTER.include?(@game_type)
    player = player_instance(is_computer, character)
    player.set_color(Colorize::RED)
    player
  end
  
  private
  
  def player_instance(is_a_computer, character)
    if is_a_computer
      return ComputerPlayer.new(character, COMPUTER_MOVE_CLASSES[@difficulty])
    end
    return HumanPlayer.new(character)
  end
  
end