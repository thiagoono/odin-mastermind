require_relative "base_game"

# Class for the game where the computer creates the password and the human answers
class HumanGame < BaseGame
  attr_reader :answer, :attempts

  def initialize
    super
    display_board
    @answer = [COLORS[rand(6)], COLORS[rand(6)], COLORS[rand(6)], COLORS[rand(6)]]
  end

  # Makes an attempt to guess the answer
  def attempt?
    colors = []
    1.upto(4) { |num| colors << ask_color(num) }
    return @board.end_game? if try_combination?(colors)

    false
  end
end
