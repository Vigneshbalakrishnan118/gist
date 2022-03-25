module Welcome
  class Tag < Client
    def find_all
      url = "https://aws-api-testing.getgist.com/tags"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end
  end
end
