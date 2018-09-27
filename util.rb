require 'yaml'

def today_string
  Time.now.strftime('%A %b %d, %Y')
end

def title_today(base_title)
  "#{base_title} for #{today_string}"
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

def underscored_date
  Time.now.strftime('%Y_%m_%d_%a').downcase
end

def open_file
  # TODO: here
end
