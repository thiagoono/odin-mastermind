require_relative "game_config"

require "colorize"

# Class created to display the elements to the user
class Board
  include GameConfig

  def initialize(game)
    @game = game
  end

  # Displays the final board
  def end_game?
    display_board
    puts "|          SECRET COMBINATION           |"
    puts "|               #{@game.answer.map { |color| '●'.colorize(color) }.join(' ')}                |"
    puts "+---------------------------------------+"

    true
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
    MAX_ATTEMPTS.downto(@game.attempts.size) do |round|
      puts "| #{round.to_s.rjust(2)} |  ( ) ( ) ( ) ( )  |  o  o  o  o  |"
    end
  end

  # Displays the previous attempts
  def display_tries
    @game.attempts.size.downto(1) do |round|
      display_attempt(round)
      display_hits(round)
    end
  end

  def display_attempt(round)
    print "| #{round.to_s.rjust(2)} |  (#{@game.attempts[round - 1][:colors].map do |color|
      '●'.colorize(color)
    end.join(') (')})  |  "
  end

  def display_hits(round)
    puts "#{@game.attempts[round - 1][:hits].join(' ')}  |"
  end
end
