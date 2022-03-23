# frozen_string_literal: true

require_relative "welcome/version"

module Welcome
  def self.create(name)
    puts "Hi, #{name}! Ruby Welcome's you!"
  end
end
