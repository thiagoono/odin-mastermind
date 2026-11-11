require_relative "mastermind/human_game"
require_relative "mastermind/computer_game"

new_game = HumanGame.new

next until new_game.attempt?
