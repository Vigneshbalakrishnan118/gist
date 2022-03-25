# frozen_string_literal: true

module Welcome
  class SubscriptionType < Client
    def find_all
      url = "https://aws-api-testing.getgist.com/subscription_types"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end

    def find(id:)
      url = "https://aws-api-testing.getgist.com/subscription_types/#{id}"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end
  end
end
