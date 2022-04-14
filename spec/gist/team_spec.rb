require "spec_helper"
require "gist"
require "gist/client"
require "gist/team"

RSpec.describe Gist::Team do
  before(:all) do
    @client = Gist::Client.new(access_token: ENV["BEARER_ACCESS_TOKEN"])
  end

  describe "find team" do
    it "should find with id" do
      response = @client.teams.find(id: 1)
      expect(response[:status]).to eq("200 OK")
    end
  end

  describe "team index" do
    it "should be listable" do
      response = @client.teams.find_all
      expect(response[:status]).to eq("200 OK")
    end
  end
end
