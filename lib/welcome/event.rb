# frozen_string_literal: true

module Welcome
  class Event < Client
    def find_all
      fetch("#{@url}events?event_type=all")
    end
  end
end
