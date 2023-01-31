# frozen_string_literal: true

require_relative "tablab/version"
require_relative "tablab/input"
require_relative "tablab/formatting"

module TabLab
  class Error < StandardError; end
  tab = format_heading
  loop do
    clear
    puts HELP_STRING
    puts tab

    command = get_char
    case command
    when COMMANDS[:quit]
      break
    when COMMANDS[:new_measure]
      tab = cat_tab(tab, NEW_MEASURE)
    when /[1-6]/
      puts "You have selected string #{command}"
      fret_number = handle_string_input
      tab = cat_tab(tab, format_new_note(command.to_i, fret_number))
    end
  end
end
