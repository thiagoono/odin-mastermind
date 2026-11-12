# Module created to make the computer find the solution for the game
module GameSolver
  attr_reader :colors_in_answer, :left_side, :right_side

  def initialize
    super
    @colors_in_answer = []
    @left_side = []
    @right_side = []
  end

  # Method to make the computer make a new attempt
  def attempt?
    return true if find_colors?

    p colors_in_answer

    return true if find_sides?

    find_positions
  end

  private

  # Finds all the colors and its quantities in the secret combination
  def find_colors?
    GameConfig::COLORS[0...-1].each do |color|
      sleep 2

      break if colors_in_answer.size >= 4

      return true if try_combination?(Array.new(4, color))

      hits = @attempts[-1][:hits].reject { |hit| hit == "o" }
      hits.size.times { colors_in_answer << color }
    end

    fill_with_last_color?
  end

  def fill_with_last_color?
    return try_combination?(Array.new(4, GameConfig::COLORS[-1])) if colors_in_answer.empty?

    colors_in_answer.fill(GameConfig::COLORS[-1], colors_in_answer.size...4)
    false
  end

  # Finds to which side (left or right) each color is positioned in the answer
  def find_sides
  end

  # Finds the exact position each of the colors are positioned in the solution
  def find_positions
  end
end
