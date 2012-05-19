require "spec_helper"

describe WritersController do
  describe "routing" do

    it "routes to #index" do
      get("/writers").should route_to("writers#index")
    end

    it "routes to #new" do
      get("/writers/new").should route_to("writers#new")
    end

    it "routes to #show" do
      get("/writers/1").should route_to("writers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/writers/1/edit").should route_to("writers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/writers").should route_to("writers#create")
    end

    it "routes to #update" do
      put("/writers/1").should route_to("writers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/writers/1").should route_to("writers#destroy", :id => "1")
    end

  end
end
