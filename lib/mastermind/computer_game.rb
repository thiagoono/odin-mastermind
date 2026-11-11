require_relative "base_game"

# Class for the game mode where the user types the secret combination and the computer must guess
class ComputerGame < BaseGame
  def initialize(answer)
    super
    @answer = get_answer
  end
end
