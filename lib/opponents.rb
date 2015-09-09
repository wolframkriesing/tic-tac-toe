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
    if @game_type == COMPUTER_VS_HUMAN
      return [ComputerPlayer.new(@player2_char), HumanPlayer.new(@player1_char)]
    end 
    if @game_type == COMPUTER_VS_COMPUTER
      return [ComputerPlayer.new(@player2_char), ComputerPlayer.new(@player1_char)]
    end 
    if @game_type == HUMAN_VS_HUMAN
      return [HumanPlayer.new(@player2_char), HumanPlayer.new(@player1_char)]
    end 
	  [HumanPlayer.new(@player1_char), ComputerPlayer.new(@player2_char)]
  end
  
end