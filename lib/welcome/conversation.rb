# frozen_string_literal: true

module Welcome
  class Conversation < Client
    def find_all
      url = "https://aws-api-testing.getgist.com/onversations?order=desc&order_by=updated_at"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end

    def find(id:)
      url = "https://aws-api-testing.getgist.com/conversations/#{id}"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end
  end
end
