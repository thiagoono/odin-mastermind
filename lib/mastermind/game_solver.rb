module GameSolver
  attr_accessor :colors_in_answer

  # Method to make the computer make a new attempt
  def attempt?
    find_colors
    find_sides
    find_positions
  end
end
