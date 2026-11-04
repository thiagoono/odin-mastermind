require_relative "base_game"

# Class for the game where the computer creates the password and the human answers
class HumanGame
  include BaseGame

  attr_reader :answer

  def initialize
    @attempts = []
    @answer = Array.new(4, COLORS[rand(8)])
  end
end
