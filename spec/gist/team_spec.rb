require "spec_helper"
require "gist"
require "gist/client"
require "gist/team"

RSpec.describe Gist::Team do
  before(:all) do
    @client = Gist::Client.new(access_token: "Bearer 2rHqyAVcuGNdwWEs7IPABm/EmrkbyOzrW55DKHqQkaaL3CVjvV+bdwcd+wwm7sTGvLg=")
  end

  describe "find team" do
    it "should find with id" do
      response = @client.teams.find(id: 1)
      expect(response.code).to eq("200")
    end
  end

  describe "team index" do
    it "should be listable" do
      response = @client.teams.find_all
      expect(response.code).to eq("200")
    end
  end
end
