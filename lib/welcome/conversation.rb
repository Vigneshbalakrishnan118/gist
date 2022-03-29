# frozen_string_literal: true

module Welcome
  class Conversation < Client
    def find_all
      fetch("#{@url}conversations?order=desc&order_by=updated_at")
    end

    def find(id:)
      fetch("#{@url}conversations/#{id}")
    end
  end
end
