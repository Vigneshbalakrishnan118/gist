require "spec_helper"
require "gist"
require "gist/client"
require "gist/contact"

RSpec.describe Gist::Contact do
  before(:all) do
    @client = Gist::Client.new(access_token: "Bearer 2rHqyAVcuGNdwWEs7IPABm/EmrkbyOzrW55DKHqQkaaL3CVjvV+bdwcd+wwm7sTGvLg=")
    @contact = @client.contacts.create(params: example_create_contact)
    @contact_details = JSON.parse(@contact.body)
  end

  it "should create" do
    expect(@contact[:status]).to eq("200 OK")
  end

  it "should update" do
    response = @client.contacts.update(params: example_update_contact)
    expect(response[:status]).to eq("200 OK")
  end

  it "should find with id" do
    response = @client.contacts.find(id: @contact_details["contact"]["id"])
    expect(response[:status]).to eq("200 OK")
  end

  it "should find with email" do
    response = @client.contacts.find(email: @contact_details["contact"]["email"])
    expect(response[:status]).to eq("200 OK")
  end

  it "should find with user_id" do
    response = @client.contacts.find(user_id: @contact_details["contact"]["user_id"])
    expect(response[:status]).to eq("200 OK")
  end

  it "should delete" do
    response = @client.contacts.delete(id: @contact_details["contact"]["id"])
    expect(response[:status]).to eq("200 OK")
  end

  it "should be listable" do
    response = @client.contacts.find_all
    expect(response[:status]).to eq("200 OK")
  end

  it "should bulk create" do
    response = @client.contacts.create_in_batch(params: example_batch)
    expect(response[:status]).to eq("200 OK")
  end

  it "should bulk update" do
    response = @client.contacts.update_in_batch(params: example_batch)
    expect(response[:status]).to eq("200 OK")
  end
end
