# Tic Tac Toe

This is the initial board, when you play against a computer.

       +---+---+---+
       | 0 | 1 | 2 |
       +---+---+---+
       | 3 | 4 | 5 |
       +---+---+---+
       | 6 | 7 | 8 |
       +---+---+---+
	   
The goal is to get three in a row, column or diagonal.
Hit the number of the cell you want to claim, then it's the computer's turn.

# Start the game

Either run `./tic-tac-toe.sh` from this directory.
Or run `ruby lib/start_game.rb`

# Options

To either of the above you can pass the following parameters:
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

Enjoy the game