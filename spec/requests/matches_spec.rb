require 'rails_helper'

RSpec.xdescribe "Matches", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/match/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/match/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/match/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/match/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/match/destroy"
      expect(response).to have_http_status(:success)
    end
  end
end
