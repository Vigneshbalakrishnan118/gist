# frozen_string_literal: true

module Welcome
  class Teammate < Client
    def find_all
      fetch("#{@url}teammates")
    end

    def find(id:)
      fetch("#{@url}teammates/#{id}")
    end
  end
end
