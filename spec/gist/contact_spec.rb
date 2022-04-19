require "spec_helper"
require "gist"
require "gist/client"
require "gist/contact"

RSpec.describe Gist::Contact do
  before(:all) do
    @client = Gist::Client.new(access_token: "Sp8dwaxjE7NqcfMm0X2jOSK58hvvkpZGTnou5eHA9KTIQ/hlmX5U60kZx95kdMrvkqo=")
    @contact = @client.contacts.create(params: example_create_contact)
    @contact_details = JSON.parse(@contact.body)
  end

  describe "create contact" do
    context "with valid parameters" do
      it "should create" do
        expect(@contact[:status]).to eq("200 OK")
      end
    end

    context "with invalid parameters" do
      it "shouldn't create" do
        response = @client.contacts.create(params: example_invalid_contact)
        expect(response[:status]).to eq("422 Unprocessable Entity")
      end
    end
  end

  describe "update contact" do
    context "with valid parameters" do
      it "should update" do
        response = @client.contacts.update(params: example_update_contact)
        expect(response[:status]).to eq("200 OK")
      end
    end

    context "with invalid parameters" do
      it "shouldn't update" do
        response = @client.contacts.update(params: example_invalid_contact)
        expect(response[:status]).to eq("422 Unprocessable Entity")
      end
    end
  end

  describe "find contact" do
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
  end

  describe "delete contact" do
    it "should delete" do
      response = @client.contacts.delete(id: @contact_details["contact"]["id"])
      expect(response[:status]).to eq("200 OK")
    end
  end

  describe "contact index" do
    it "should be listable" do
      response = @client.contacts.find_all
      expect(response[:status]).to eq("200 OK")
    end
  end

  describe "contact batch" do
    it "should bulk create" do
      response = @client.contacts.create_in_batch(params: example_batch)
      expect(response[:status]).to eq("200 OK")
    end

    it "should bulk update" do
      response = @client.contacts.update_in_batch(params: example_batch)
      expect(response[:status]).to eq("200 OK")
    end
  end
end
