require "spec_helper"
require "gist"
require "gist/client"
require "gist/teammate"

RSpec.describe Gist::Teammate do
  before(:all) do
    @client = Gist::Client.new(access_token: "Bearer 2rHqyAVcuGNdwWEs7IPABm/EmrkbyOzrW55DKHqQkaaL3CVjvV+bdwcd+wwm7sTGvLg=")
  end

  describe "find teammate" do
    it "should find with id" do
      response = @client.teammates.find(id: 31)
      expect(response.code).to eq("200")
    end
  end

  describe "teammate index" do
    it "should be listable" do
      response = @client.teammates.find_all
      expect(response.code).to eq("200")
    end
  end
end
