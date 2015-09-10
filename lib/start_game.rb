require 'getoptlong'
require_relative "./game.rb"
require_relative "./opponents.rb"
require_relative "./string"

player1_character = "X"
player2_character = "O"
game_type = Opponents::HUMAN_VS_COMPUTER
difficulty = Opponents::DIFFICULTY_MEDIUM

opts = GetoptLong.new(
  [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
  [ "--player1", "-p", GetoptLong::OPTIONAL_ARGUMENT ],
  [ "--player2", "-o", GetoptLong::OPTIONAL_ARGUMENT ],
  [ "--gametype", "-g", GetoptLong::OPTIONAL_ARGUMENT ],
  [ "--difficulty", "-d", GetoptLong::OPTIONAL_ARGUMENT ],
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

  --difficulty x, -d x:
    The difficulty of the game.
      0 = easy - the computer can easily be beaten
      1 = medium - means it can be beaten but only with a series of intelligent moves
      2 = hard - means the computer is unbeatable

      EOF
      exit
    when '--player1'
      player1_character = arg  
	  when '--player2'
      player2_character = arg
	  when '--gametype'
      game_types = {
        "0" => Opponents::HUMAN_VS_COMPUTER,
        "1" => Opponents::COMPUTER_VS_HUMAN,
        "2" => Opponents::HUMAN_VS_HUMAN,
        "3" => Opponents::COMPUTER_VS_COMPUTER
      }
      game_type = game_types[arg] || game_type
	  when '--difficulty'
      difficulties = {
        "0" => Opponents::DIFFICULTY_EASY,
        "1" => Opponents::DIFFICULTY_MEDIUM,
        "2" => Opponents::DIFFICULTY_HARD,
      }
      difficulty = difficulties[arg] || difficulty
  end
end  

opponents = Opponents.new(game_type, difficulty)
players = [opponents.player1(player1_character.green), opponents.player2(player2_character.red)]
game = Game.new(players)
game.start_game
