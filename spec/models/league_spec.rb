require 'rails_helper'

RSpec.describe League, type: :model do
  describe "relationships" do
    it {should have_many(:teams)}
    it {should belong_to(:season)}
  end

  describe "instance methods" do
    it "#team_of_user returns the team of the user" do
      user = create(:user, :full_setup)
      active_league = League.first
      user_team = Team.first
      expect(active_league.team_of_user(user)).to eq(user_team)
    end
  end
end
