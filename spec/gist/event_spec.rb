

require "spec_helper"
require "gist"
require "gist/client"
require "gist/event"

RSpec.describe Gist::Contact do
  before(:all) do
    @client = Gist::Client.new(access_token: "Bearer 2rHqyAVcuGNdwWEs7IPABm/EmrkbyOzrW55DKHqQkaaL3CVjvV+bdwcd+wwm7sTGvLg=")
  end

  it "should find with id" do
    response = @client.events.track(params: example_event_track)
    expect(response[:status]).to eq("200 OK")
  end

  it "should be listable" do
    response = @client.events.find_all
    expect(response[:status]).to eq("200 OK")
  end
end
