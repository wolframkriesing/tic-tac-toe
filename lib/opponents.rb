class Opponents

  HUMAN_VS_COMPUTER = 0
  COMPUTER_VS_HUMAN = 1
  HUMAN_VS_HUMAN = 2
  COMPUTER_VS_COMPUTER = 3
  
  def initialize(player1_char, player2_char, game_type=HUMAN_VS_COMPUTER)
    @player1_char = player1_char
    @player2_char = player2_char
    @game_type = game_type
  end
	
  def players
	[player1, player2]
  end
  
  private
  
  def player1_is_a_computer?
	@game_type == COMPUTER_VS_COMPUTER or @game_type == COMPUTER_VS_HUMAN
  end
  
  def player2_is_a_computer?
	@game_type == COMPUTER_VS_COMPUTER or @game_type == HUMAN_VS_COMPUTER
  end
  
  def player1
	if player1_is_a_computer?
	  return ComputerPlayer.new(@player1_char)
	end
	HumanPlayer.new(@player1_char)
  end
  
  def player2
	if player2_is_a_computer?
	  return ComputerPlayer.new(@player2_char)
	end
	HumanPlayer.new(@player2_char)
  end
  
end