require 'getoptlong'
require_relative "./game.rb"
require_relative "./board_output.rb"

player1_character = "X"
player2_character = "O"

opts = GetoptLong.new(
  [ "--player1", "-p", GetoptLong::OPTIONAL_ARGUMENT ],
  [ "--player2", "-o", GetoptLong::OPTIONAL_ARGUMENT ],
)  
opts.each do |opt, arg|  
  case opt  
    when '--player1'
      player1_character = arg  
	when '--player2'
      player2_character = arg
  end
end  

game = Game.new(BoardOutput, player1_character, player2_character)
game.start_game
