require "spec_helper"
require "gist"
require "gist/client"
require "gist/event"

RSpec.describe Gist::Event do
  before(:all) do
    @client = Gist::Client.new(access_token: "Sp8dwaxjE7NqcfMm0X2jOSK58hvvkpZGTnou5eHA9KTIQ/hlmX5U60kZx95kdMrvkqo=")
  end

  describe "track event" do
    context "with valid parameters" do
      it "should track" do
        response = @client.events.track(params: example_event_track)
        expect(response[:status]).to eq("200 OK")
      end
    end

    context "with invalid parameters" do
      it "shouldn't track" do
        response = @client.events.track(params: example_invalid_event)
        expect(response[:status]).to eq("422 Unprocessable Entity")
      end
    end
  end

  describe "event index" do
    it "should be listable" do
      response = @client.events.find_all
      expect(response[:status]).to eq("200 OK")
    end
  end
end
