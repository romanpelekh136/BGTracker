require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "associations" do
    it { should have_many(:matches).through(:match_results) }
    it { should have_many(:player_ratings) }
    it { should have_many(:board_games).through(:player_ratings) }
  end
end
