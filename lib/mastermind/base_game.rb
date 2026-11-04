# Declares the module that will contain all the elements from the human and computer games
module BaseGame
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
