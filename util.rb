require_relative './environment'
require 'yaml'

def today_string
  date_string(Time.now)
end

def date_string(time)
  time.strftime('%A %b %d, %Y')
end

def nearest_15_min_string
  now = Time.now
  fifteens = (now.min / 15).round
  nearest_fifteen = now.beginning_of_hour + (fifteens * 15).minutes
  nearest_fifteen.strftime('%I:%M%P')
end

def title_today(base_title)
  "#{base_title} for #{today_string}"
end

def weekly_title(week_start)
  "Weekly notes for week of #{date_string(week_start)}"
end

def week_start
  Time.now.sunday? ? (Time.now + 1.day).beginning_of_week : Time.now.beginning_of_week
end

def front_matter_yaml(title, tags)
  {
    'title' => title,
    'tags' => tags,
  }.to_yaml + "---\n" # closing lines signal end of front matter in markdown
end

def write_file(file_name, content)
  File.open(file_name, 'w+') { |file| file.write(content) }
end

def underscored_date(note_type)
  time = note_type == 'weekly' ? week_start : Time.now
  time.strftime('%Y_%m_%d_%a').downcase
end

def create_file_name(note_type, path)
  raise StandardError, "Must define ENV['BASE_NOTES_DIR']" unless ENV['BASE_NOTES_DIR']

  dir = File.join(ENV['BASE_NOTES_DIR'], path)
  dir = File.expand_path(dir)

  File.join(dir, "#{note_type}_#{underscored_date(note_type)}.md")
end

def open_file(file_name)
  cmd = "open #{file_name}"
  cmd += " -a #{ENV['TEXT_EDITOR']}" if ENV['TEXT_EDITOR']

  puts "=> #{cmd}"
  `#{cmd}`
end
