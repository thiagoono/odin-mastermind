require "colorize"

module GameConfig
  MAX_ATTEMPTS = 10
  ANSWER_LENGTH = 4
  COLORS = %i[red green yellow blue magenta cyan].freeze
  PERFECT_HIT = "●".freeze
  PARTIAL_HIT = "●".colorize(:black).freeze
end
