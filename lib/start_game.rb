require_relative "./game.rb"
require_relative "./board_output.rb"

game = Game.new(BoardOutput)
game.start_game
