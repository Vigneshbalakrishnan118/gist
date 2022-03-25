# frozen_string_literal: true

require_relative "welcome/version"
require "net/http"

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

  class Tag < Client
    def find_all
      url = "https://aws-api-testing.getgist.com/tags"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end
  end

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

  class Campaign < Client
    def find_all
      url = "https://aws-api-testing.getgist.com/campaigns"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end

    def find(id:)
      url = "https://aws-api-testing.getgist.com/campaigns/#{id}"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end
  end

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

  class Teammate < Client
    def find_all
      url = "https://aws-api-testing.getgist.com/teammates"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end

    def find(id:)
      url = "https://aws-api-testing.getgist.com/teammates/#{id}"
      @uri = URI(url)
      request = Net::HTTP::Get.new @uri
      trigger_request(request)
    end
  end

  class Conversation < Client
    def find_all
      url = "https://aws-api-testing.getgist.com/conversations?order=desc&order_by=updated_at"
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
