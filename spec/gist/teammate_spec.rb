require "spec_helper"
require "gist"
require "gist/client"
require "gist/teammate"

RSpec.describe Gist::Contact do
  before(:all) do
    @client = Gist::Client.new(access_token: "Bearer 2rHqyAVcuGNdwWEs7IPABm/EmrkbyOzrW55DKHqQkaaL3CVjvV+bdwcd+wwm7sTGvLg=")
  end

  it "should find with id" do
    response = @client.teammates.find(id: 31)
    expect(response[:status]).to eq("200 OK")
  end

  it "should be listable" do
    response = @client.teammates.find_all
    expect(response[:status]).to eq("200 OK")
  end
end
