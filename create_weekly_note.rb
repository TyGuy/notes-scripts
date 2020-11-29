require_relative './util'
require_relative './templates'

notes_path = ENV['WEEKLY_NOTES_PATH'] || 'weekly'
note_type = 'weekly'
title = weekly_title(week_start)
tags = %w[notes weekly solstice shyft todo]


text = Templates::WeeklyNoteV1.template(title: title, tags: tags, week_start: week_start)
# puts text

file_name = create_file_name(note_type, notes_path)

write_file(file_name, text)

puts "created #{note_type} file at: #{file_name}"

open_file(file_name)
