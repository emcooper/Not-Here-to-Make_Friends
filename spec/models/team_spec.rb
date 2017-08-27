require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "relationships" do
    it {should belong_to(:league)}
    it {should have_many(:team_members)}
    it {should have_many(:users)}
    it {should have_many(:team_contestants)}
    it {should have_many(:contestants)}
  end

  describe "instance methods" do
    it "#season_points returns teams total points for season" do
      create(:user, :full_setup)
      team_1 = Team.first
      team_2 = Team.second

      expect(team_1.season_points).to eq(6)
      expect(team_2.season_points).to eq(4)
    end
  end
end
