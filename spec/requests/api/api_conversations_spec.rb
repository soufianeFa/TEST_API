require 'rails_helper'

RSpec.describe "Api::Conversations", type: :request do
  describe "GET /api_conversations" do
    it "works! (now write some real specs)" do
      get api_conversations_path
      expect(response).to have_http_status(200)
    end
  end
end
