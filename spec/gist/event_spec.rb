require "spec_helper"
require "gist"
require "gist/client"
require "gist/event"

RSpec.describe Gist::Event do
  before(:all) do
    @client = Gist::Client.new(access_token: "Bearer 2rHqyAVcuGNdwWEs7IPABm/EmrkbyOzrW55DKHqQkaaL3CVjvV+bdwcd+wwm7sTGvLg=")
  end

  describe "track event" do
    context "with valid parameters" do
      it "should track" do
        response = @client.events.track(params: example_event_track)
        expect(response.code).to eq("200")
      end
    end

    context "with invalid parameters" do
      it "shouldn't track" do
        response = @client.events.track(params: example_invalid_event)
        expect(response.code).to eq("422")
      end
    end
  end

  describe "event index" do
    it "should be listable" do
      response = @client.events.find_all
      expect(response.code).to eq("200")
    end
  end
end
