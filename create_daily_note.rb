require_relative './util'
require_relative './templates'

notes_path = ENV['DAILY_NOTES_PATH'] || 'daily'
note_type = 'daily'
title = title_today('Daily Notes')
tags = %w[notes daily solstice shyft todo]

# text = Templates::DailyNoteV2.template(title: title, tags: tags)
text = Templates::DailyNoteV3.template(title: title, tags: tags)
# puts text

file_name = create_file_name(note_type, notes_path)

write_file(file_name, text)

puts "created #{note_type} file at: #{file_name}"

open_file(file_name)
