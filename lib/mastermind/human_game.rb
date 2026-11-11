require_relative "base_game"

# Class for the game where the computer creates the password and the human answers
class HumanGame < BaseGame
  attr_reader :answer, :attempts

  def initialize
    super
    @answer = [COLORS[rand(6)], COLORS[rand(6)], COLORS[rand(6)], COLORS[rand(6)]]
  end

  # Makes an attempt to guess the answer
  def attempt?
    colors = []
    1.upto(4) { |num| colors << ask_color(num) }
    return @board.end_game? if try_combination?(colors) || @attempts.size >= MAX_ATTEMPTS

    false
  end

  private

  # Asks the color and convert it to a symbol
  def ask_color(num)
    loop do
      puts "Type the color #{num}"
      color = color_to_symbol(gets.strip)

      return color if color

      puts "\nWarning: Invalid color! Please try again.\n".colorize(color: :red, mode: :underline)
    end
  end
end
