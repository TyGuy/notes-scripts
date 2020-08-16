require_relative '../util'
require_relative '../environment'

module Templates
  class DailyNoteV3
    class << self
      def template(args)
        title = args[:title]
        tags = args[:tags]

        text = <<~MDF
          #{front_matter_yaml(title, tags)}

          # #{title}

          ### To do list
          #{to_do_list(Time.now)}

          ### Time Log
          * #{nearest_15_min_string}

        MDF

        text
      end

      def to_do_list(day)
        if day.on_weekday?
          <<~LIST
            * [ ] organize
              * [ ] fill out goal tracking doc
              * [ ] copy tasks from yesterday
              * [ ] catch up on emails
              * [ ] catch up on slack messages
              * [ ] fill events and fuel data checks
              * [ ] backup computer
          LIST
        else
          <<~LIST
            * [ ] .
          LIST
        end
      end
    end
  end
end
