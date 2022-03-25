# frozen_string_literal: true

module Welcome
  class Team < Client
    def find_all
      url = "https://aws-api-testing.getgist.com/teams"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end

    def find(id:)
      url = "https://aws-api-testing.getgist.com/teams/#{id}"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end
  end
end
