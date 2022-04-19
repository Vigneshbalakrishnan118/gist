require "spec_helper"
require "gist"
require "gist/client"
require "gist/teammate"

RSpec.describe Gist::Teammate do
  before(:all) do
    @client = Gist::Client.new(access_token: "Sp8dwaxjE7NqcfMm0X2jOSK58hvvkpZGTnou5eHA9KTIQ/hlmX5U60kZx95kdMrvkqo=")
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
