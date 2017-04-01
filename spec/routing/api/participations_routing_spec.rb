require "rails_helper"

RSpec.describe Api::ParticipationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/participations").to route_to("api/participations#index")
    end

    it "routes to #new" do
      expect(:get => "/api/participations/new").to route_to("api/participations#new")
    end

    it "routes to #show" do
      expect(:get => "/api/participations/1").to route_to("api/participations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/api/participations/1/edit").to route_to("api/participations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/participations").to route_to("api/participations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/participations/1").to route_to("api/participations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/participations/1").to route_to("api/participations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/participations/1").to route_to("api/participations#destroy", :id => "1")
    end

  end
end
