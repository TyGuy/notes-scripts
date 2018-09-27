require_relative './util'

notes_path = ENV['STANDUP_NOTES_PATH'] || 'daily/standup'
note_type = 'standup'
title = title_today('Standup')
tags = %w[notes daily solstice standups]

people = %w[Ugwem Cole Tyler Ekundayo]

person_standup_template = <<~STT
  ### {{name}}:
  - yest:
    -
  - today:
    -
  - asks:
    -
STT

standup_template_content = people.map do |person_name|
  person_standup_template.gsub('{{name}}', person_name)
end.join("\n")

text = <<~TXT
  #{front_matter_yaml(title, tags)}

  # #{title}

  #{standup_template_content}
TXT

file_name = create_file_name(note_type, notes_path)

write_file(file_name, text)

puts "created standup file at: #{file_name}"

open_file(file_name)
