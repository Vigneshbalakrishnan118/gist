require "spec_helper"
require "gist"
require "gist/client"
require "gist/teammate"

RSpec.describe Gist::Teammate do
  before(:all) do
    @client = Gist::Client.new(access_token: ENV["BEARER_ACCESS_TOKEN"])
  end

  describe "find teammate" do
    it "should find with id" do
      response = @client.teammates.find(id: 31)
      expect(response[:status]).to eq("200 OK")
    end
  end

  describe "teammate index" do
    it "should be listable" do
      response = @client.teammates.find_all
      expect(response[:status]).to eq("200 OK")
    end
  end
end
