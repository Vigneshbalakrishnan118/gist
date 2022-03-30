# frozen_string_literal: true

module Gist
  class Contact < Client
    def find(id:)
      fetch("#{@url}contacts/#{id}")
    end

    def find_all(order: "desc", order_by: "created_at", page: 1, per_page: 10)
      fetch("#{@url}contacts?order=#{order}&order_by=#{order_by}&page=#{page}&per_page=#{per_page}")
    end

    def create(params:)
      create_request("#{@url}contacts", params)
    end

    def update(params:)
      create_request("#{@url}contacts", params)
    end

    def delete(id:)
      delete_request("#{@url}contacts/#{id}")
    end

    def create_in_batch(params:)
      create_request("#{@url}contacts/batch", params)
    end

    def update_in_batch(params:)
      create_request("#{@url}contacts/batch", params)
    end
  end
end
