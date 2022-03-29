# frozen_string_literal: true

module Welcome
  class Form < Client
    def find_all
      fetch("#{@url}forms")
    end

    def find(id:)
      fetch("#{@url}forms?form_id=#{id}")
    end

    def find_submissions(id:)
      fetch("#{@url}forms/#{id}/submissions")
    end
  end
end