require_relative "base_game"
require_relative "game_solver"

# Class for the game mode where the user types the secret combination and the computer must guess
class ComputerGame < BaseGame
  include GameSolver

  def initialize
    super
    @answer = ask_answer
    @board.display_board
  end

  def try_combination?(colors)
    sleep 1.5
    super
  end

  private

  # Method destined to ask the user for the secret combination of colors
  def ask_answer
    answer = []
    1.upto(4) { |num| answer << ask_color(num) }
    answer
  end
end
