require 'rails_helper'

RSpec.describe MatchResult, type: :model do
  describe 'associations' do
    it { should belong_to(:match) }
    it { should belong_to(:player) }
  end

  describe "validations" do
    context "without a rank" do
      it "creates an invalid result" do
        result = build(:match_result, rank: nil)
        expect(result).to be_invalid
      end
    end
  end
end
