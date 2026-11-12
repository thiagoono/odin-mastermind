require_relative "mastermind/human_game"
require_relative "mastermind/computer_game"

puts "Which mode do you want to play?"
puts "1. The human guesses"
puts "2. The computer guesses\n\n"

new_game = nil
until new_game
  game_mode = gets.to_i
  if game_mode == 1
    new_game = HumanGame.new
  elsif game_mode == 2
    new_game = ComputerGame.new
  else
    mensagem = "Invalid game mode! Please try again.".colorize(color: :red, mode: :underline)
    print "\e[2K\r#{mensagem}\e[2K\r"
    sleep 2
  end
end

loop do
  next until new_game.attempt?

  break unless new_game.play_again?

  new_game = if game_mode == 1
               HumanGame.new
             else
               ComputerGame.new
             end
end
