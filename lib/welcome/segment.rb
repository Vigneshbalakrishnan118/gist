# frozen_string_literal: true

module Welcome
  class Segment < Client
    def find_all
      url = "https://aws-api-testing.getgist.com/segments?per_page=2&page=5&include_count=true"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end

    def find(id:)
      url = "https://aws-api-testing.getgist.com/segments/#{id}?include_count=true"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end
  end
end