require 'rails_helper'

RSpec.describe PlayerRating, type: :model do
  describe "associations" do
    it { should belong_to(:board_game) }
    it { should belong_to(:player) }
  end
end
