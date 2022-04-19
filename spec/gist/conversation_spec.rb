require "spec_helper"
require "gist"
require "gist/client"
require "gist/conversation"

RSpec.describe Gist::Conversation do
  before(:all) do
    @client = Gist::Client.new(access_token: "Bearer 2rHqyAVcuGNdwWEs7IPABm/EmrkbyOzrW55DKHqQkaaL3CVjvV+bdwcd+wwm7sTGvLg=")
    @conversation = @client.conversations.create(params: example_create_conversation)
    @conversation_details = JSON.parse(@conversation.body)
    @messages = @client.conversations.find_all_messages(id: @conversation_details["conversation"]["id"])
    @messages_details = JSON.parse(@messages.body)
  end

  describe "create conversation" do
    context "with valid parameters" do
      it "should create" do
        expect(@conversation.code).to eq("200")
      end
    end

    context "with valid parameters" do
      it "shouldn't create" do
        response = @client.conversations.create(params: example_invalid_conversation)
        expect(response.code).to eq("422")
      end
    end
  end

  describe "update conversation" do
    it "should update" do
      response = @client.conversations.update(id: @conversation_details["conversation"]["id"], params: example_update_conversation)
      expect(response.code).to eq("200")
    end
  end

  describe "find conversation" do
    it "should find with id" do
      response = @client.conversations.find(id: @conversation_details["conversation"]["id"])
      expect(response.code).to eq("200")
    end
  end

  describe "find messages" do
    it "should find all messages" do
      expect(@messages.code).to eq("200")
    end
  end

  describe "conversation tag" do
    it "should apply tag" do
      puts @messages_details['messages'][0]['id']
      response = @client.conversations.apply_tag(id: @conversation_details["conversation"]["id"],
                                                 params: { "message_id": @messages_details['messages'][0]['id'], "tags": "new tag" })
      expect(response.code).to eq("200")
    end

    it "should remove tag" do
      response = @client.conversations.remove_tag(id: @conversation_details["conversation"]["id"],
                                                  params: { "message_id": @messages_details['messages'][0]['id'], "tag_id": 328 })
      expect(response.code).to eq("200")
    end
  end

  describe "conversation status change" do
    context "with valid parameters" do
      it "should change status" do
        response = @client.conversations.change_status(id: @conversation_details["conversation"]["id"], params: example_change_status)
        expect(response.code).to eq("200")
      end
    end

    context "with valid parameters" do
      it "shouldn't change status" do
        response = @client.conversations.change_status(id: @conversation_details["conversation"]["id"], params: invalid_change_status)
        expect(response.code).to eq("422")
      end
    end
  end

  describe "conversation assignment" do
    it "should assign conversation" do
      response = @client.conversations.assign(id: @conversation_details["conversation"]["id"], params: example_assign)
      expect(response.code).to eq("200")
    end

    it "should unassign conversation" do
      response = @client.conversations.unassign(id: @conversation_details["conversation"]["id"], params: example_unassign)
      expect(response.code).to eq("200")
    end
  end

  describe "conversation reply" do
    context "with valid parameters" do
      it "should reply" do
        response = @client.conversations.add_reply(id: @conversation_details["conversation"]["id"], params: example_reply)
        expect(response.code).to eq("200")
      end
    end

    context "with valid parameters" do
      it "shouldn't reply" do
        response = @client.conversations.add_reply(id: @conversation_details["conversation"]["id"], params: example_invalid_reply)
        expect(response.code).to eq("422")
      end
    end
  end

  describe "delete conversation" do
    it "should delete" do
      response = @client.conversations.delete(id: @conversation_details["conversation"]["id"])
      expect(response.code).to eq("200")
    end
  end

  describe "conversation index" do
    it "should be listable" do
      response = @client.conversations.find_all
      expect(response.code).to eq("200")
    end
  end

  describe "conversation count" do
    it "should get global count" do
      response = @client.conversations.global_counts
      expect(response.code).to eq("200")
    end

    it "should get teammates count" do
      response = @client.conversations.teammates_count
      expect(response.code).to eq("200")
    end

    it "should get teams count" do
      response = @client.conversations.teams_count
      expect(response.code).to eq("200")
    end
  end
end
