# frozen_string_literal: true

TUNING = "EADGBe"

N_STRINGS = 6

### Concatenates x and y
def cat_tab(x, y)
  result = ""
  x.lines.count.times do |i|
    line = x.lines[i].gsub("\n", "") + (y.lines[i] or "")
    result += line
  end
  result
end

def format_tuning
  result = ""
  TUNING.split("").reverse.each_with_index do |x, i|
    result += "#{N_STRINGS - i} #{x} \n"
  end
  result
end

def format_heading
  cat_tab format_tuning, ("|\n" * N_STRINGS)
end

NEW_MEASURE = "-+\n" * N_STRINGS

def format_new_note(string, note)
  result = ""
  N_STRINGS.times do |i|
    result += if N_STRINGS - i == string
                "-#{note}\n"
              else
                "#{"-" * (note.length + 1)}\n" # +1 for padding
              end
  end
  result
end
