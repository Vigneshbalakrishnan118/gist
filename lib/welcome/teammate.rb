# frozen_string_literal: true

module Welcome
  class Teammate < Client
    def find_all
      url = "https://aws-api-testing.getgist.com/teammates"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end

    def find(id:)
      url = "https://aws-api-testing.getgist.com/teammates/#{id}"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end
  end
end
