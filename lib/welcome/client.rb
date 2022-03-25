# frozen_string_literal: true

module Welcome
  class Client
    def initialize(access_token:)
      @access_token = access_token
    end

    def contacts
      Welcome::Contact.new(access_token: @access_token)
    end

    def events
      Welcome::Event.new(access_token: @access_token)
    end

    def tags
      Welcome::Tag.new(access_token: @access_token)
    end

    def subscription_types
      Welcome::SubscriptionType.new(access_token: @access_token)
    end

    def segments
      Welcome::Segment.new(access_token: @access_token)
    end

    def forms
      Welcome::Form.new(access_token: @access_token)
    end

    def campaigns
      Welcome::Campaign.new(access_token: @access_token)
    end

    def teams
      Welcome::Team.new(access_token: @access_token)
    end

    def teammates
      Welcome::Teammate.new(access_token: @access_token)
    end

    def conversations
      Welcome::Conversation.new(access_token: @access_token)
    end

    def trigger_request(request)
      request["Authorization"] = @access_token
      request["Content-Type"] = "application/json"
      http = Net::HTTP.new(@uri.host, @uri.port)
      http.use_ssl = true
      http.read_timeout = 5 #seconds
      response = http.request(request)
      response.body
    end
  end
end
