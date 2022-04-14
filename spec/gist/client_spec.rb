require 'spec_helper'
require 'gist'
require 'gist/client'

RSpec.describe Gist::Client do
  before do
    @client = Gist::Client.new(access_token: ENV["BEARER_ACCESS_TOKEN"])
  end

  describe "#initialize" do
    it "initialises client" do
      expect(@client).to be_instance_of(Gist::Client)
    end
  end

end