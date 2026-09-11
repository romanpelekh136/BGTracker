require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:player) { create(:player, username: "testname", password: "testpass") }

  describe "POST /login" do
    context "with valid credentials" do
      it "reddirects to the root path" do
      end
    end

    context "with invalid credentials" do
      before do
        sign_in player
        post login_path, params: { username: player.username, password: "wrong password" }
      end

      it "returns an unprocessable status" do
        puts "REDIRECT TARGET: #{response.headers['Location']}"
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "sets the flash message" do
        expect(flash[:alert]).to eq("Wrong combination of username and password!")
      end
    end


    context "when user is authenticated" do
    end
  end
end
