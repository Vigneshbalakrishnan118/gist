# frozen_string_literal: true

module Welcome
  class Segment < Client
    def find_all
      fetch("#{@url}segments?per_page=2&page=5&include_count=true")
    end

    def find(id:)
      fetch("#{@url}segments/#{id}?include_count=true")
    end
  end
end