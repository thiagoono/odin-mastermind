require "colorize"

module GameConfig
  MAX_ATTEMPTS = 10
  ANSWER_LENGTH = 4
  COLORS = %i[red green yellow blue magenta light_cyan].freeze
  PERFECT_HIT = "●".colorize(:black).freeze
  PARTIAL_HIT = "●".freeze
end
