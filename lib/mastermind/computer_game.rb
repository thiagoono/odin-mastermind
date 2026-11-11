require_relative "base_game"

# Class for the game mode where the user types the secret combination and the computer must guess
class ComputerGame < BaseGame
  def initialize(answer)
    super
    @answer = ask_answer
  end

  private

  def ask_answer
    1.upto(4) { |num| @answer << ask_color(num) }
  end
end
