module GameSolver
  attr_reader :colors_in_answer, :left_side, :right_side

  def initialize
    super
    @colors_in_answer = []
    @left_side = []
    @right_side = []
  end

  # Executes the complete solving strategy.
  def attempt?
    return true if find_colors?
    return true if find_sides?

    find_positions
  end

  private

  # Stage 1: discovers the colors and their quantities.
  def find_colors?
    GameConfig::COLORS[0...-1].each do |color|
      break if colors_in_answer.size >= GameConfig::ANSWER_LENGTH

      guess = Array.new(GameConfig::ANSWER_LENGTH, color)
      return true if try_combination?(guess)

      valid_hits = [GameConfig::PERFECT_HIT, GameConfig::PARTIAL_HIT]
      color_count = current_hits.count { |hit| valid_hits.include?(hit) }

      colors_in_answer.concat([color] * color_count)
    end

    fill_with_last_color?
  end

  # Infers the quantity of the last color.
  def fill_with_last_color?
    last_color = GameConfig::COLORS.last
    remaining = GameConfig::ANSWER_LENGTH - colors_in_answer.size

    # If no other color was found, the answer consists of four
    # occurrences of the last color.
    if colors_in_answer.empty?
      return try_combination?(
        Array.new(GameConfig::ANSWER_LENGTH, last_color)
      )
    end

    colors_in_answer.concat([last_color] * remaining)
    false
  end

  # Stage 2: discovers which colors belong to each side.
  def find_sides?
    counts = colors_in_answer.tally

    case counts.values.sort
    when [1, 1, 1, 1]
      four_colors?
    when [1, 1, 2]
      three_colors?
    when [2, 2]
      two_colors?
    when [1, 3]
      three_and_one?
    else
      raise "Unexpected color distribution: #{counts.inspect}"
    end
  end

  # Four different colors: A, B, C, D.
  def four_colors?
    a, b, c, d = colors_in_answer

    try_combination?([a, a, b, b])

    first_white = perfect_hits_count

    case first_white
    when 1
      # A and B are on the same side.
      try_combination?([a, a, c, c])

      case perfect_hits_count
      when 2
        set_sides([a, b], [c, d])
      when 0
        set_sides([c, d], [a, b])
      else
        raise "Unexpected feedback while identifying four-color sides."
      end

    when 2, 0
      # A and B are on opposite sides.
      try_combination?([c, c, d, d])

      second_white = perfect_hits_count

      if first_white == 2
        case second_white
        when 2
          set_sides([a, c], [b, d])
        when 0
          set_sides([a, d], [b, c])
        else
          raise "Unexpected feedback while identifying C and D."
        end
      else
        case second_white
        when 2
          set_sides([b, c], [a, d])
        when 0
          set_sides([b, d], [a, c])
        else
          raise "Unexpected feedback while identifying C and D."
        end
      end

    else
      raise "Unexpected feedback while identifying four different colors."
    end

    false
  end

  # Three different colors: A, B, C, with C appearing twice.
  def three_colors?
    counts = colors_in_answer.tally

    a, b = counts.select { |_, quantity| quantity == 1 }.keys
    c = counts.find { |_, quantity| quantity == 2 }.first

    try_combination?([a, a, b, b])

    case perfect_hits_count
    when 1
      # A and B are on the same side.
      return true if try_combination?([a, b, c, c])

      case perfect_hits_count
      when 2
        set_sides([a, b], [c, c])
      when 0
        set_sides([c, c], [a, b])
      else
        raise "Unexpected feedback while identifying three-color sides."
      end

    when 2
      # A is on the left, B is on the right.
      set_sides([a, c], [b, c])

    when 0
      # B is on the left, A is on the right.
      set_sides([b, c], [a, c])

    else
      raise "Unexpected feedback while identifying three different colors."
    end

    false
  end

  # Two different colors, each appearing twice.
  def two_colors?
    a, b = colors_in_answer.tally.keys

    return true if try_combination?([a, a, b, b])

    case perfect_hits_count
    when 2
      set_sides([a, b], [a, b])
    when 0
      set_sides([b, b], [a, a])
    else
      raise "Unexpected feedback while identifying two-color sides."
    end

    false
  end

  # One color appears three times; the other appears once.
  def three_and_one?
    counts = colors_in_answer.tally

    a = counts.find { |_, quantity| quantity == 3 }.first
    b = counts.find { |_, quantity| quantity == 1 }.first

    try_combination?([a, a, b, b])

    case perfect_hits_count
    when 1
      set_sides([a, b], [a, a])
    when 3
      set_sides([a, a], [a, b])
    else
      raise "Unexpected feedback while identifying three-and-one sides."
    end

    false
  end

  # Stage 3: discovers the exact position of every color.
  def find_positions
    initial_guess = left_side + right_side

    return true if try_combination?(initial_guess)

    case perfect_hits_count
    when 2
      # Exactly one side is reversed.
      if right_side[0] == right_side[1]
        # The right side has identical colors, so only the left
        # side can be reversed.
        return try_combination?(left_side.reverse + right_side)
      end

      # Try reversing the right side.
      return true if try_combination?(left_side + right_side.reverse)

      # If the guess has zero white hits, the left side was reversed.
      raise "Unexpected feedback while identifying exact positions." unless perfect_hits_count.zero?

      try_combination?(left_side.reverse + right_side)

    when 0
      # Both sides are reversed.
      try_combination?(left_side.reverse + right_side.reverse)

    else
      raise "Unexpected feedback while identifying exact positions."
    end
  end

  # Returns the feedback from the most recent unsuccessful attempt.
  def current_hits
    @attempts.last.fetch(:hits)
  end

  # Counts white markers: correct color AND correct position.
  def perfect_hits_count
    current_hits.count(GameConfig::PERFECT_HIT)
  end

  def set_sides(left, right)
    @left_side = left
    @right_side = right
  end
end
