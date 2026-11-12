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

      hits = @attempts.last[:hits]
      color_count = hits.count do |hit|
        [GameConfig::PERFECT_HIT, GameConfig::PARTIAL_HIT].include?(hit)
      end
      colors_in_answer.concat([color] * color_count)
    end

    fill_with_last_color?
  end

  # Fills the array with the last color, try combination if there are 4 of the same
  def fill_with_last_color?
    return try_combination?(Array.new(4, GameConfig::COLORS[-1])) if colors_in_answer.empty?

    colors_in_answer.fill(GameConfig::COLORS[-1], colors_in_answer.size...4)
    false
  end

  # Finds to which side (left or right) each color is positioned in the answer
  def find_sides?
    case colors_in_answer.uniq.size
    when 2
      two_colors?
    when 3
      three_colors?
    else
      four_colors?
    end
  end

  def three_colors?
  end

  def four_colors?
    colors = colors_in_answer
    try_combination?([colors[0], colors[0], colors[1], colors[1]])

    perfect_hits = hits.count(GameConfig::PERFECT_HIT)
    partial_hits = hits.count(GameConfig::PARTIAL_HIT)
    case [perfect_hits, partial_hits]
    when [1, 1]
    # Um acerto perfeito e um parcial
    when [2, 0]
    # Dois acertos perfeitos
    when [0, 2]
      # Dois acertos parciais
    end
  end

  # Finds the exact position each of the colors are positioned in the solution
  def find_positions
  end
end
