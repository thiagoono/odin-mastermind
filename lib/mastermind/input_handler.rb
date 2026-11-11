# Module destined to get the inputs from the user and transform them into usable variables
module InputHandler
  # Asks the color and convert it to a symbol
  def ask_color(num)
    loop do
      puts "Type the color #{num}"
      color = color_to_symbol(gets.strip)

      return color if color

      puts "\nWarning: Invalid color! Please try again.\n".colorize(color: :red, mode: :underline)
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
