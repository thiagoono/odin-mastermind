# Module created to make the computer find the solution for the game
module GameSolver
  attr_accessor :colors_in_answer

  # Method to make the computer make a new attempt
  def attempt?
    find_colors
    find_sides
    find_positions
  end

  private

  # Finds all the colors and its quantities in the secret combination
  def find_colors
  end

  # Finds to which side (left or right) each color is positioned in the answer
  def find_sides
  end

  # Finds the exact position each of the colors are positioned in the solution
  def find_positions
end
