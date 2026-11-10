# Declares the class that will contain all the elements from the human and computer games
class BaseGame
  MAX_ATTEMPTS = 10
  ANSWER_LENGTH = 4
  COLORS = %i[red green yellow blue magenta cyan].freeze
  PERFECT_HIT = "●".freeze
  PARTIAL_HIT = "○".freeze

  # Allows the player/computer make an attempt
  def try_combination?(colors)
    return true if colors == @answer

    @attempts.push({ colors: colors, hits: get_hits(colors) })
    display_board
    false
  end

  private

  # Calls the methods that will search for hits
  def get_hits(colors)
    hits = []
    hits << get_perfect_hits(colors)
    hits << get_partial_hits(colors, hits)
    hits.flatten
  end

  # Searches for colors that exist and are in the correct place
  def get_perfect_hits(colors)
    hits = []
    colors.each_with_index do |color, index|
      hits << PERFECT_HIT if color == @answer[index]
    end
    hits
  end

  # Searches for colors that exist, but are in the wrong place
  def get_partial_hits(colors, perfect_hits)
    hits = []
    colors.uniq.each do |color|
      hits_quantity = [@answer.count(color) - perfect_hits.count(color), colors.count(color)].min
      hits << Array.new(hits_quantity, PARTIAL_HIT)
    end
    hits
  end

  # Displays the board
  def display_board
    puts "+---------------------------------------+"
    puts "|               MASTERMIND              |"
    puts "+---------------------------------------+"
    puts "|       COMBINACAO       |   FEEDBACK   |"
    puts "+---------------------------------------+"
    display_remaining_tries
    display_tries
    puts "+---------------------------------------+"
  end

  # Displays the attempts that were not yet made
  def display_remaining_tries
    MAX_ATTEMPTS.downto(@attempts.size) do |round|
      puts "| #{round.to_s.rjust(2)} |  ( ) ( ) ( ) ( )   |  o  o  o  o  |"
    end
  end

  # Displays the previous attempts
  def display_tries
    @attempts.size.downto(1) do |round|
      prints "| #{round.to_s.rjust(2)} |  (#{@attempts[round - 1].colors.join(') (')})  |  "
      puts "#{@attempts[rounds - 1].hits.join(' ')}  |"
    end
  end

  # Displays the final board
  def end_game
    display_board
    puts "|          SECRET COMBINATION           |"
    puts "|               #{answer.map { |color| '●'.colorize(color) }.join(' ')}              |"
    puts "+---------------------------------------+"
  end
end
