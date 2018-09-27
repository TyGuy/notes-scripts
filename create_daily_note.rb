require_relative './util'

DAILY_NOTES_DIR = ENV['DAILY_NOTES_DIR'] || '/Users/tylerdavis/notes/solstice/daily'

title = title_today('Daily Notes')
tags = %w[notes daily solstice todo]

template_markdown_string = <<~MDF
  #{front_matter_yaml(title, tags)}

  # #{title}

  ### TODO:
  * [ ]

  ### Schedule
  * [ ]

  ### From Yesterday
  {{yest}}
MDF

# puts template_markdown_string

file_name = "#{DAILY_NOTES_DIR}/daily_#{underscored_date}.md"

write_file(file_name, template_markdown_string)

puts "created standup file at: #{file_name}"
