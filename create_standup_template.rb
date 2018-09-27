require_relative './util'

STANDUP_NOTES_DIR = ENV['STANDUP_NOTES_DIR'] || '/Users/tylerdavis/notes/solstice/daily/standups'

title = title_today('Standup')
tags = %w[notes daily solstice standups]

underscored_date

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

file_name = "#{STANDUP_NOTES_DIR}/standup_#{underscored_date}.md"

write_file(file_name, text)

puts "created standup file at: #{file_name}"
