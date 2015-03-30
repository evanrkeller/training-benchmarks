require "rails_helper"

RSpec.describe PracticesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/practices").to route_to("practices#index")
    end

    it "routes to #new" do
      expect(:get => "/practices/new").to route_to("practices#new")
    end

    it "routes to #show" do
      expect(:get => "/practices/1").to route_to("practices#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/practices/1/edit").to route_to("practices#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/practices").to route_to("practices#create")
    end

    it "routes to #update" do
      expect(:put => "/practices/1").to route_to("practices#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/practices/1").to route_to("practices#destroy", :id => "1")
    end

  end
end
