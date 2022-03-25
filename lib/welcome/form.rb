# frozen_string_literal: true

module Welcome
  class Form < Client
    def find_all
      url = "https://aws-api-testing.getgist.com/forms"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end

    def find(id:)
      url = "https://aws-api-testing.getgist.com/forms?form_id=#{id}"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end

    def find_submissions(id:)
      url = "https://aws-api-testing.getgist.com/forms/#{id}/submissions"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end
  end
end