require 'rails_helper'

RSpec.describe "Api::Participations", type: :request do
  describe "GET /api_participations" do
    it "works! (now write some real specs)" do
      get api_participations_path
      expect(response).to have_http_status(200)
    end
  end
end
