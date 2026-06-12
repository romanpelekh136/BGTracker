require 'rails_helper'

RSpec.describe BoardGame, type: :model do
  describe "associations" do
    it { should have_many(:matches) }
    it { should have_many(:player_ratings) }

    it { should have_many(:players).through(:player_ratings) }
  end
end
