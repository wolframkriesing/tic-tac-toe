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
```
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
```

You want to have some fun watching the computer play against itself with a grid of 10x10?
Try this: `./tic-tac-toe.sh --gametype=3 --difficulty=1 --rowscount=10`

# Run the tests

By calling `ruby specs/all_tests.rb`
If you want to develop and run the tests continuously you can use the following
`while sleep 1; do ruby specs/all_tests.rb; done`

Enjoy the game
