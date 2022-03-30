# frozen_string_literal: true

module Gist
  class Client
    def initialize(access_token:)
      @access_token = access_token
      @url = "https://aws-api-testing.getgist.com/"
    end

    def contacts
      Contact.new(access_token: @access_token)
    end

    def events
      Event.new(access_token: @access_token)
    end

    def tags
      Tag.new(access_token: @access_token)
    end

    def subscription_types
      SubscriptionType.new(access_token: @access_token)
    end

    def segments
      Segment.new(access_token: @access_token)
    end

    def forms
      Form.new(access_token: @access_token)
    end

    def campaigns
      Campaign.new(access_token: @access_token)
    end

    def teams
      Team.new(access_token: @access_token)
    end

    def teammates
      Teammate.new(access_token: @access_token)
    end

    def conversations
      Conversation.new(access_token: @access_token)
    end

    def fetch(url)
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end

    def create_request(url, params)
      @uri = URI(url)
      request = Net::HTTP::Post.new @uri
      request.body = params.to_json
      trigger_request(request)
    end

    def update_request(url, params)
      @uri = URI(url)
      request = Net::HTTP::Patch.new @uri
      request.body = params.to_json
      trigger_request(request)
    end

    def delete_request(url, params: {})
      @uri = URI(url)
      request = Net::HTTP::Delete.new @uri
      request.body = params.to_json if params.present?
      trigger_request(request)
    end

    def trigger_request(request)
      request["Authorization"] = @access_token
      request["Content-Type"] = "application/json"
      http = Net::HTTP.new(@uri.host, @uri.port)
      http.use_ssl = true
      http.read_timeout = 5 # seconds
      http.request(request)
    end
  end
end
