# frozen_string_literal: true

module Welcome
  class Tag < Client
    def find_all
      fetch("#{@url}tags")
    end
  end
end
