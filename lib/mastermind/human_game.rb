require_relative "base_game"

# Class for the game where the computer creates the password and the human answers
class HumanGame < BaseGame
  def initialize
    super
    @answer = [COLORS[rand(6)], COLORS[rand(6)], COLORS[rand(6)], COLORS[rand(6)]]
    @board.display_board
  end

  # Makes an attempt to guess the answer
  def attempt?
    colors = []
    1.upto(4) { |num| colors << ask_color(num) }
    try_combination?(colors)
  end
end
