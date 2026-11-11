require_relative "mastermind/human_game"

new_game = HumanGame.new

next until new_game.attempt?
