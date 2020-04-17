require_relative '../util'

module Templates
  class DailyNoteV2
    class << self
      def template(args)
        title = args[:title]
        tags = args[:tags]
        text = <<~MDF
          #{front_matter_yaml(title, tags)}

          # #{title}

          ### To do list
          * [ ] copy items from yesterday

          ### Schedule
          * [ ]

          ### Time Log
          * .

        MDF

        text
      end
    end
  end
end
