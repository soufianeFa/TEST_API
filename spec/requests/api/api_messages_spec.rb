require 'rails_helper'

RSpec.describe "Api::Messages", type: :request do
  describe "GET /api_messages" do
    it "works! (now write some real specs)" do
      get api_messages_path
      expect(response).to have_http_status(200)
    end
  end
end
