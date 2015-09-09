require 'getoptlong'
require_relative "./game.rb"
require_relative "./board_output.rb"

player1_character = "X"
player2_character = "O"
game_type = Game::HUMAN_VS_COMPUTER

opts = GetoptLong.new(
  [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
  [ "--player1", "-p", GetoptLong::OPTIONAL_ARGUMENT ],
  [ "--player2", "-o", GetoptLong::OPTIONAL_ARGUMENT ],
  [ "--gametype", "-g", GetoptLong::OPTIONAL_ARGUMENT ],
)  
opts.each do |opt, arg|  
  case opt
    when '--help'
      puts <<-EOF
tic tac toe [OPTION] ...

  -h, --help:
    show help

  --player1 x, -p x:
    The character to be used for player 1

  --player2 x, -o x:
    The character to be used for player 2

  --gametype x, -g x:
    The type of game (first player always starts), 
      0 = human vs. computer
      1 = computer vs. human
      2 = human vs. human
      3 = computer vs. computer

      EOF
      exit
    when '--player1'
      player1_character = arg  
	  when '--player2'
      player2_character = arg
	  when '--gametype'
      game_types = {
        0 => Game::HUMAN_VS_COMPUTER,
        1 => Game::COMPUTER_VS_HUMAN,
        2 => Game::HUMAN_VS_HUMAN,
        3 => Game::COMPUTER_VS_COMPUTER
      }
      game_type = game_types[arg] || Game::HUMAN_VS_COMPUTER
  end
end  

game = Game.new(BoardOutput, player1_character, player2_character, game_type)
game.start_game
