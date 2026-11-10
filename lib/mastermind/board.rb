require_relative "game_config"

# Class created to display the elements to the user
class Board
  include GameConfig

  def initialize(game)
    @game = game
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

  private

  # Displays the attempts that were not yet made
  def display_remaining_tries
    MAX_ATTEMPTS.downto(@board.attempts.size) do |round|
      puts "| #{round.to_s.rjust(2)} |  ( ) ( ) ( ) ( )   |  o  o  o  o  |"
    end
  end

  # Displays the previous attempts
  def display_tries
    @board.attempts.size.downto(1) do |round|
      display_attempt(round)
      display_hits(round)
    end
  end

  def display_attempt(round)
    print "| #{round.to_s.rjust(2)} |  (#{@board.attempts[round - 1].colors.join(') (')})  |  "
  end

  def display_hits(round)
    puts "#{@board.attempts[round - 1].hits.join(' ')}  |"
  end

  # Displays the final board
  def end_game?
    display_board
    puts "|          SECRET COMBINATION           |"
    puts "|               #{@board.answer.map { |color| '●'.colorize(color) }.join(' ')}              |"
    puts "+---------------------------------------+"

    true
  end
end
