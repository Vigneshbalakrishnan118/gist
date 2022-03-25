# frozen_string_literal: true

module Welcome
  class Contact < Client
    def find(id:)
      url = "https://aws-api-testing.getgist.com/contacts/#{id}"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end

    def create(params:)
      url = "https://aws-api-testing.getgist.com/contacts/"
      @uri = URI(url)
      request = Net::HTTP::Post.new @uri
      request.body = params
      trigger_request(request)
    end

    def update(id:, params:)
      url = "https://aws-api-testing.getgist.com/contacts/#{id}"
      @uri = URI(url)
      request = Net::HTTP::Put.new @uri
      request.body = params
      trigger_request(request)
    end

    def delete(id:)
      url = "https://aws-api-testing.getgist.com/contacts/#{id}"
      @uri = URI(url)
      request = Net::HTTP::Delete.new @uri
      trigger_request(request)
    end
  end

  class Event < Client
    def find_all
      url = "https://aws-api-testing.getgist.com/events?event_type=all"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end
  end
end