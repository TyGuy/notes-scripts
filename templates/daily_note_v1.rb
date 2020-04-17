require_relative '../util'

module Templates
  class DailyNoteV1
    class << self
      def template(args)
        title = args[:title]
        tags = args[:tags]
        text = <<~MDF
          #{front_matter_yaml(title, tags)}

          # #{title}

          ### TODO:
          * [ ]


          ### Schedule
          * [ ]


          ### Standup
          * .


          ### Time Log
          | start   | stop    | description                                                  |
          | ------- | ------- | ------------------------------------------------------------ |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |
          |         |         |                                                              |

        MDF

        text
      end
    end
  end
end
