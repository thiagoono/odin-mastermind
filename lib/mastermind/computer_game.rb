require_relative "base_game"

# Class for the game mode where the user types the secret combination and the computer must guess
class ComputerGame < BaseGame
  def initialize
    super
    @answer = ask_answer
  end

  # Method to make the computer make a new attempt
  def attempt?
    sleep 2
    colors = make_a_guess
    try_combination?(colors)
  end

  private

  # Method destined to ask the user for the secret combination of colors
  def ask_answer
    answer = []
    1.upto(4) { |num| answer << ask_color(num) }
    answer
  end

  # Algorithm to make a n intelligent guess based on the previous attempts and hits
  def make_a_guess
    [COLORS[rand(6)], COLORS[rand(6)], COLORS[rand(6)], COLORS[rand(6)]]
  end
end
