# frozen_string_literal: true

COMMANDS = {
  tuning: "t",
  time_signature: "s",
  new_measure: "m",
  new_note: " ",
  quit: "q"
}.freeze

HELP_STRING = "Press a number 1-6 to select a string to enter a fret number. Press #{COMMANDS[:new_measure]} to start a new measure. Press #{COMMANDS[:quit]} to quit."

def clear
  system("clear") || system("cls")
end

def get_char
  state = `stty -g`
  `stty raw -echo -icanon isig`
  $stdin.getc.chr
ensure
  `stty #{state}`
end

def handle_string_input
  print "Fret number: "
  gets.chomp
end
