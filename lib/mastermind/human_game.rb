require_relative "base_game"

# Class for the game where the computer creates the password and the human answers
class HumanGame < BaseGame
  include BaseGame

  attr_reader :answer

  def initialize
    super
    @attempts = []
    @answer = Array.new(4, COLORS[rand(8)])
  end

  # Makes an attempt to guess the answer
  def attempt
    colors = []
    1.upto(4) { |num| colors << ask_color(num) }
    end_game if try_combination?(colors) || @attempts.size >= MAX_ATTEMPTS
  end
end
