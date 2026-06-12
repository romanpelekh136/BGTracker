require 'rails_helper'

RSpec.describe MatchResult, type: :model do
  describe "associations" do
    it { should belong_to(:match) }
    it { should belong_to(:player) }
  end
end
