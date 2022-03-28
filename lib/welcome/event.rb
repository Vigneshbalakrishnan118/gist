# frozen_string_literal: true

module Welcome
  class Event < Client
    def find_all
      url = "https://aws-api-testing.getgist.com/events?event_type=all"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end
  end
end
