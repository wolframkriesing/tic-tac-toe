[x] improve board readability, maybe removing all "useless" chars
[x] warn user about bad input
[x] dont skip step on bad user input
[x] show basic instructions on start of the game
[x] show won/lost message
[x] improve hard-to-see-changes, maybe by clearing the screen after every move!?
[x] somehow indicate which was the last move of the computer (maybe using colors)

New Features

[x] Allow the user to select the level of difficulty (“easy” means the computer can easily be beaten, “medium” means it can be beaten but only with a series of intelligent moves, and “hard” means the computer is unbeatable).
[x] Allow users to choose game type (human v. human, computer v. computer, human v. computer).
[x] Allow user to choose which player goes first.
[x] Allow the user to decide with what “marker” each player will mark their selections on the board (obviously, traditionally it’s “X” and “O”).

[] use 1-9 instead of 0-8 for user input
[] write out who's turn it is
[] show the game type
[] dont monkey patch string
[] decouple from puts
[] decouple from gets
[] use rows instead of explicit accessing 0,1,2 in the Winner, to make it easy to make a 4x4 board
[] fix bug, which crashes on wrong input
[] pass baord size as param
[] more generic board
[] provide menu (in addition to cmd line params)