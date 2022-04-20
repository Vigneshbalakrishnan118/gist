require "spec_helper"
require "gist"
require "gist/client"
require "gist/contact"

RSpec.describe Gist::Contact do
  before(:all) do
    @client = Gist::Client.new(access_token: ENV["API_KEY"])
    @contact = @client.contacts.create(params: example_create_contact)
    @contact_details = JSON.parse(@contact.body)
  end

  describe "create contact" do
    context "with valid parameters" do
      it "should create" do
        expect(@contact.code).to eq("200")
      end
    end

    context "with invalid parameters" do
      it "shouldn't create" do
        response = @client.contacts.create(params: example_invalid_contact)
        expect(response.code).to eq("422")
      end
    end
  end

  describe "update contact" do
    context "with valid parameters" do
      it "should update" do
        response = @client.contacts.update(params: example_update_contact)
        expect(response.code).to eq("200")
      end
    end

    context "with invalid parameters" do
      it "shouldn't update" do
        response = @client.contacts.update(params: example_invalid_contact)
        expect(response.code).to eq("422")
      end
    end
  end

  describe "find contact" do
    it "should find with id" do
      response = @client.contacts.find(id: @contact_details["contact"]["id"])
      expect(response.code).to eq("200")
    end

    it "should find with email" do
      response = @client.contacts.find(email: @contact_details["contact"]["email"])
      expect(response.code).to eq("200")
    end

    it "should find with user_id" do
      response = @client.contacts.find(user_id: @contact_details["contact"]["user_id"])
      expect(response.code).to eq("200")
    end
  end

  describe "delete contact" do
    it "should delete" do
      response = @client.contacts.delete(id: @contact_details["contact"]["id"])
      expect(response.code).to eq("200")
    end
  end

  describe "contact index" do
    it "should be listable" do
      response = @client.contacts.find_all
      expect(response.code).to eq("200")
    end
  end

  describe "contact batch" do
    it "should bulk create" do
      response = @client.contacts.create_in_batch(params: example_batch)
      expect(response.code).to eq("200")
    end

    it "should bulk update" do
      response = @client.contacts.update_in_batch(params: example_batch)
      expect(response.code).to eq("200")
    end
  end
end
