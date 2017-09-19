require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "relationships" do
    it {should belong_to(:league)}
    it {should have_many(:team_members)}
    it {should have_many(:users)}
    it {should have_many(:team_contestants)}
    it {should have_many(:contestants)}
    it {should have_many(:draft_picks)}
  end

  describe "callbacks" do
    it "draft_picks are created upon team creation" do
      season = create(:season)
      contestants = create_list(:contestant, 5, season: season)
      league = create(:league, season: season)
      team = create(:team, league: league)

      expect(team.draft_picks.count).to eq(5)
      expect(team.draft_picks.pluck(:contestant_id)).to eq(contestants.pluck(:id))
    end
  end

  describe "instance methods" do
    it "#season_points returns teams total points for season" do
      create(:user, :full_setup)
      team_1 = Team.first
      team_2 = Team.second

      expect(team_1.season_points).to eq(6)
      expect(team_2.season_points).to eq(4)
    end

    it "#week_points returns team's total points for given week" do
      create(:user, :full_setup)
      team_1 = Team.first
      team_2 = Team.second
      week_1 = Week.first

      expect(team_1.week_points(week_1)).to eq(6)
      expect(team_2.week_points(week_1)).to eq(2)
    end
  end
end
