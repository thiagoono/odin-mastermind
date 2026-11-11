require_relative "game_config"

require "colorize"

# Class created to display the elements to the user
class Board
  include GameConfig

  def initialize(game)
    @game = game
    display_colors
  end

  # Displays the available colors to the user
  def display_colors
    puts "+-------------------------+"
    puts "|     AVAILABLE COLORS    |"
    puts "+-------------------------+"
    puts "| #{'●'.colorize(:red)}  red      #{'●'.colorize(:green)}  green    |"
    puts "| #{'●'.colorize(:blue)}  blue     #{'●'.colorize(:yellow)}  yellow   |"
    puts "| #{'●'.colorize(:magenta)}  magenta  #{'●'.colorize(:light_cyan)}  cyan     |"
    puts "+-------------------------+\n"
  end

  # Displays the final board
  def end_game
    clear_board
    display_board
    puts "|          SECRET COMBINATION           |"
    puts "|               #{@game.answer.map { |color| '●'.colorize(color) }.join(' ')}                 |"
    puts "+---------------------------------------+"
  end

  # Displays the board
  def display_board
    puts "+---------------------------------------+"
    puts "|               MASTERMIND              |"
    puts "+---------------------------------------+"
    puts "|       COMBINATION      |   FEEDBACK   |"
    puts "+---------------------------------------+"
    display_remaining_tries
    display_tries
    puts "+---------------------------------------+\n"
  end

  def clear_board
    16.times { print "\e[1A\e[2K" }
  end

  private

  # Displays the attempts that were not yet made
  def display_remaining_tries
    return if @game.attempts.size == MAX_ATTEMPTS

    MAX_ATTEMPTS.downto(@game.attempts.size + 1) do |round|
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
    puts "#{@game.attempts[round - 1][:hits].join('  ')}  |"
  end
end
