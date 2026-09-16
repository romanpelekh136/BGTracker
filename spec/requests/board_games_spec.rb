require 'rails_helper'

RSpec.describe "BoardGames", type: :request do
  let(:player) { create(:player) }

  let (:valid_params) { attributes_for(:board_game) }

  let(:invalid_params) { attributes_for(:board_game, tittle: nil) }

  describe "POST /create" do
    context "with a valid params" do
      before do
        sign_in player
        post board_games_path, params: { board_game: valid_params }
      end

      it "redirects to board_game page" do
        expect(response).to redirect_to(board_game_path(BoardGame.last))
      end

      it "sets the flash message" do
        expect(flash[:notice]).to eq("Successfully created")
      end
    end
  end

  describe "GET /index" do
    let!(:board_games) { create_list(:board_game, 4) }
    before do
      sign_in player
      get board_games_path
    end
    it "returns all games" do
      puts "DEBUGGING #{board_games}"
      expect(response.body).to include(board_games[0].title)
    end
  end
end
