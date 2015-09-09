class Opponents

  HUMAN_VS_COMPUTER = 0
  COMPUTER_VS_HUMAN = 1
  HUMAN_VS_HUMAN = 2
  COMPUTER_VS_COMPUTER = 3
  
  def initialize(game_type=HUMAN_VS_COMPUTER)
    @game_type = game_type
  end
	
  def player1(character)
    if player1_is_a_computer?
      return ComputerPlayer.new(character)
    end
    HumanPlayer.new(character)
  end
  
  def player2(character)
    if player2_is_a_computer?
      return ComputerPlayer.new(character)
    end
    HumanPlayer.new(character)
  end
  
  private
  
  def player1_is_a_computer?
	  @game_type == COMPUTER_VS_COMPUTER or @game_type == COMPUTER_VS_HUMAN
  end
  
  def player2_is_a_computer?
	  @game_type == COMPUTER_VS_COMPUTER or @game_type == HUMAN_VS_COMPUTER
  end
  
end