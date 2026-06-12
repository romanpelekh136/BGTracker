require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "associations" do
    it { should belong_to(:board_game) }
    it { should have_many(:match_results) }
    it { should have_many(:players).through(:match_results) }
  end
end
