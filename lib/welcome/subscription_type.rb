# frozen_string_literal: true

module Welcome
  class SubscriptionType < Client
    def find_all
      fetch("#{@url}subscription_types")
    end

    def find(id:)
      fetch("#{@url}subscription_types/#{id}")
    end
  end
end
