require_relative "board"
require_relative "game_config"

require "colorize"

# Declares the class that will contain all the elements from the human and computer games
class BaseGame
  include GameConfig

  attr_reader :board, :attempts

  def initialize
    @attempts = []
    @board = Board.new(self)
  end

  protected

  # Allows the player/computer make an attempt
  def try_combination?(colors)
    return true if colors == @answer

    @attempts.push({ colors: colors, hits: get_hits(colors) })
    @board.display_board
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
