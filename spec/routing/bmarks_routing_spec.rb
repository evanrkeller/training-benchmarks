require "rails_helper"

RSpec.describe BmarksController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/benchmarks").to route_to("bmarks#index")
    end

    it "routes to #new" do
      expect(:get => "/benchmarks/new").to route_to("bmarks#new")
    end

    it "routes to #show" do
      expect(:get => "/benchmarks/1").to route_to("bmarks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/benchmarks/1/edit").to route_to("bmarks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/benchmarks").to route_to("bmarks#create")
    end

    it "routes to #update" do
      expect(:put => "/benchmarks/1").to route_to("bmarks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/benchmarks/1").to route_to("bmarks#destroy", :id => "1")
    end

  end
end
