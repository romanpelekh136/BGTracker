require 'rails_helper'

RSpec.describe BoardGame, type: :model do
  describe 'associations' do
    it { should have_many(:matches) }
    it { should have_many(:player_ratings) }

    it { should have_many(:players).through(:player_ratings) }
  end

  describe 'validations' do
    it 'creates valid board game' do
      game = build(:board_game)
      expect(game).to be_valid
    end

    context 'without a title' do
      it 'creates an invalid board game' do
        game = build(:board_game, title: "")
        expect(game).to be_invalid
        expect(game.errors[:title]).to include("can't be blank")
      end
    end

    context 'with min_players less than 1' do
      it 'creates an invalid board game' do
        game = build(:board_game, min_players: 0)
        expect(game). to be_invalid
        expect(game.errors[:min_players]).to include("must be greater than 0")
      end
    end

    context 'with not integer anount of min_players ' do
      it 'creates an invalid board game' do
        game = build(:board_game, min_players: 0.5)
        expect(game). to be_invalid
        expect(game.errors[:min_players]).to include("must be an integer")
      end
    end

    context 'with max_players lesser than min_players' do
      it 'creates an invalid board game' do
        game = build(:board_game, min_players: 2, max_players: 1)
        expect(game). to be_invalid
        expect(game.errors[:max_players]).to include("must be greater of equal to min_players")
      end
    end
  end
end
