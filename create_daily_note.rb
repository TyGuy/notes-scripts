require_relative './util'

notes_path = ENV['DAILY_NOTES_PATH'] || 'daily'
note_type = 'daily'
title = title_today('Daily Notes')
tags = %w[notes daily solstice todo]

text = <<~MDF
  #{front_matter_yaml(title, tags)}

  # #{title}

  ### TODO:
  * [ ]

  ### Schedule
  * [ ]

  ### From Yesterday
  {{yest}}
MDF

# puts text

file_name = create_file_name(note_type, notes_path)

write_file(file_name, text)

puts "created #{note_type} file at: #{file_name}"

open_file(file_name)
