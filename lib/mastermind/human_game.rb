require_relative "base_game"

# Class for the game where the computer creates the password and the human answers
class HumanGame < BaseGame
  include BaseGame

  attr_reader :answer

  def initialize
    super
    @attempts = []
    @answer = Array.new(4, COLORS[rand(8)])
  end

  # Makes an attempt to guess the answer
  def attempt?
    colors = []
    1.upto(4) { |num| colors << ask_color(num) }
    end_game if try_combination?(colors) || @attempts.size >= MAX_ATTEMPTS
  end

  # Asks the color and convert it to a symbol
  def ask_color(num)
    puts "Type the color #{num}"

    loop do
      color = gets
      return color if color_to_symbol(color)

      puts "\n\nWarning: Invalid color! Please try again.".colorize(color: :red, mode: :underline)
    end
  end

  # Converts the color written into a symbol
  def color_to_symbol(string)
    case string.downcase
    when "green"
      :green
    when "red"
      :red
    when "yellow"
      :yellow
    when "magenta"
      :magenta
    when "blue"
      :blue
    when "cyan"
      :light_cyan
    else
      false
    end
  end
end
