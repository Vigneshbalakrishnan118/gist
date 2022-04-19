require 'spec_helper'
require 'gist'
require 'gist/client'

RSpec.describe Gist::Client do
  before do
    @client = Gist::Client.new(access_token: "Sp8dwaxjE7NqcfMm0X2jOSK58hvvkpZGTnou5eHA9KTIQ/hlmX5U60kZx95kdMrvkqo=")
  end

  describe "#initialize" do
    it "initialises client" do
      expect(@client).to be_instance_of(Gist::Client)
    end
  end

end
