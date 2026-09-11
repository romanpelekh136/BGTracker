require 'rails_helper'

RSpec.describe MatchResult, type: :model do
  describe 'associations' do
    it { should belong_to(:match) }
    it { should belong_to(:player) }
  end

  describe "validations" do
    it "when no rank is invalid" do
      result = build(:match_result, rank: nil)
      expect(result).to be_invalid
    end

    it "is invalid when score is not greater or equal to 0" do
      result = build(:match_result, score: -10)
      expect(result).to be_invalid
    end

    it "is valid without a score" do
      result = build(:match_result, score: nil)
      expect(result).to be_valid
    end
  end
end
