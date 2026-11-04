# Declares the module that will contain all the elements from the human and computer games
module BaseGame
  MAX_ATTEMPTS = 10
  ANSWER_LENGTH = 4
  COLORS = %i[black red green yellow blue magenta cyan white].freeze
  PERFECT_HIT = "●".freeze
  PARTIAL_HIT = "○".freeze

  def try_combination?(colors)
    return true if colors == @answer

    @attempts.push({ colors: colors, hits: get_hits(colors) })
    display_board
    false
  end

  private

  def get_hits(colors)
    hits = []
    hits << get_perfect_hits(colors)
    hits << get_partial_hits(colors)
    hits.flatten
  end

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

  def display_remaining_tries
    10.downto(@attempts.size) do |round|
      puts "| #{round.to_s.rjust(2)} |  ( ) ( ) ( ) ( )   |  o  o  o  o  |"
    end
  end

  def display_tries
    @attempts.size.downto(1) do |round|
      prints "| #{round.to_s.rjust(2)} |  (#{@attempts[round - 1].colors.join(') (')})  |  "
      puts "#{@attempts[rounds - 1].hits.join(' ')}  |"
    end
  end
end
