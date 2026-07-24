require 'rails_helper'

RSpec.xdescribe "BoardGames", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/board_games/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/board_games/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/board_games/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/board_games/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/board_games/show"
      expect(response).to have_http_status(:success)
    end
  end
end
