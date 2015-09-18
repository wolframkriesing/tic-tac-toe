require 'getoptlong'
require_relative "game"
require_relative "board"
require_relative "game_config"
require_relative "game_screens"

player1_character, player2_character, game_type, difficulty, rows_count = [nil, nil, nil, nil, nil]

opts = GetoptLong.new(
  [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
  [ "--player1", "-p", GetoptLong::OPTIONAL_ARGUMENT ],
  [ "--player2", "-o", GetoptLong::OPTIONAL_ARGUMENT ],
  [ "--gametype", "-g", GetoptLong::OPTIONAL_ARGUMENT ],
  [ "--difficulty", "-d", GetoptLong::OPTIONAL_ARGUMENT ],
  [ "--rowscount", "-r", GetoptLong::OPTIONAL_ARGUMENT ],
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

  --rowscount x=3, -r x:
    The number of rows (and columns) the game shall have, default is 3.

      EOF
      exit
    when '--player1'
      player1_character = arg
	  when '--player2'
      player2_character = arg
	  when '--gametype'
      game_types = {
        "0" => GameConfig::HUMAN_VS_COMPUTER,
        "1" => GameConfig::COMPUTER_VS_HUMAN,
        "2" => GameConfig::HUMAN_VS_HUMAN,
        "3" => GameConfig::COMPUTER_VS_COMPUTER
      }
      game_type = game_types[arg]
	  when '--difficulty'
      difficulties = {
        "0" => GameConfig::DIFFICULTY_EASY,
        "1" => GameConfig::DIFFICULTY_MEDIUM,
        "2" => GameConfig::DIFFICULTY_HARD,
      }
      difficulty = difficulties[arg]
	  when '--rowscount'
      rows_count = arg
  end
end  

player1_character = player1_character || "X"
player2_character = player2_character || "O"
rows_count = rows_count && rows_count.to_i || 3
game_type = game_type || GameConfig::HUMAN_VS_COMPUTER
difficulty = difficulty || GameConfig::DIFFICULTY_MEDIUM

game_config = GameConfig.new(game_type, difficulty)
player1 = game_config.player1(player1_character[0])
player2 = game_config.player2(player2_character[0])
game = Game.new(player1, player2, GameScreens.new)
game.start_game(Board.new(rows_count))
