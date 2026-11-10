require_relative "mastermind/human_game"

new_game = HumanGame.new

new_game.board.display_board

next until new_game.attempt?
