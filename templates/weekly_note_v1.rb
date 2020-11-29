require_relative '../util'
require_relative '../environment'

module Templates
  class WeeklyNoteV1
    class << self
      def short_date(date)
        date.strftime('%Y-%m-%d')
      end

      def template(args)
        title = args[:title]
        tags = args[:tags]
        week_start = args[:week_start] # week start is assumed to be Monday.

        text = <<~MDF
          #{front_matter_yaml(title, tags)}

          # #{title}

          It's going to be a good week :).

          ## Sunday, #{short_date(week_start - 1.day)}

          .

          ## Monday, #{short_date(week_start)}

          .

          ## Tuesday, #{short_date(week_start + 1.day)}

          .

          ## Wednesday, #{short_date(week_start + 2.days)}

          .

          ## Thursday, #{short_date(week_start + 3.days)}

          .

          ## Friday, #{short_date(week_start + 4.days)}

          .

        MDF

        text
      end
    end
  end
end
