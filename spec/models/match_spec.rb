require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'associations' do
    it { should belong_to(:board_game) }
    it { should have_many(:match_results) }
    it { should have_many(:players).through(:match_results) }
  end

  describe "validations" do
    it "is invalid without a date" do
      match = build(:match, played_at: nil)
      expect(match).to be_invalid
    end
  end

  describe "custom validations" do
    let(:board_game) { build(:board_game, min_players: 2, max_players: 4) }
    let(:results) { (1..player_count).map { |i| build(:match_result, rank: i) } }
    let(:match) { build(:match, board_game: board_game, match_results: results) }
    context "when active players are more than max_players" do
      let(:player_count) { 5 }
      it "is invalid" do
        match.valid?
        expect(match.errors[:base]).to include("This game allows a maximum of #{board_game.max_players} players.")
      end
    end
    context "when active players are less than min_players" do
      let(:player_count) { 1 }
      it "is invalid" do
        match.valid?
        expect(match.errors[:base]).to include("This game requires at least #{board_game.min_players} players.")
      end
    end

    context "when several players are not uniq" do
      let(:player) { create(:player) }
      let(:results) { (1..4).map { |i| build(:match_result, rank: i, player: player, match: nil) } }

      it "is invalid" do
        match.valid?
        expect(match).to be_invalid
        expect(match.errors[:base]).to include("A player can be added to a match once.")
      end
    end

    context "when no winner" do
      let(:results) { (2..4).map { |i| build(:match_result, rank: i, match: nil) } }
      it "is invalid" do
        match.valid?
        expect(match).to be_invalid
        expect(match.errors[:base]).to include("A match must have a First-place winner.")
      end
    end
  end
end
