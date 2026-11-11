require_relative "base_game"

# Class for the game mode where the user types the secret combination and the computer must guess
class ComputerGame < BaseGame
  def initialize(answer)
    super
    @answer = ask_answer
  end

  # Method to make the computer make a new attempt
  def attempt?
    colors = make_a_guess
    try_combination?(colors)
  end

  private

  # Method destined to ask the user for the secret combination of colors
  def ask_answer
    1.upto(4) { |num| @answer << ask_color(num) }
  end

  def make_a_guess
  end
end
