require "rails_helper"

RSpec.describe Api::ConversationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/conversations").to route_to("api/conversations#index")
    end

    it "routes to #new" do
      expect(:get => "/api/conversations/new").to route_to("api/conversations#new")
    end

    it "routes to #show" do
      expect(:get => "/api/conversations/1").to route_to("api/conversations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/api/conversations/1/edit").to route_to("api/conversations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/conversations").to route_to("api/conversations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/conversations/1").to route_to("api/conversations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/conversations/1").to route_to("api/conversations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/conversations/1").to route_to("api/conversations#destroy", :id => "1")
    end

  end
end
