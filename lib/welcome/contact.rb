# frozen_string_literal: true

module Welcome
  class Contact < Client
    def find(id:)
      fetch("#{@url}contacts/#{id}")
    end

    def create(params:)
      url = "#{@url}contacts"
      @uri = URI(url)
      request = Net::HTTP::Post.new @uri
      request.body = params
      trigger_request(request)
    end

    def update(id:, params:)
      url = "#{@url}contacts/#{id}"
      @uri = URI(url)
      request = Net::HTTP::Put.new @uri
      request.body = params
      trigger_request(request)
    end

    def delete(id:)
      url = "#{@url}contacts/#{id}"
      @uri = URI(url)
      request = Net::HTTP::Delete.new @uri
      trigger_request(request)
    end
  end
end