require 'rails_helper'

RSpec.describe TeamContestant, type: :model do
  describe "relationships" do
    it {should belong_to(:team)}
    it {should belong_to(:contestant)}
  end

  describe "class methods" do
    it ".draft runs draft for all undrafted teams" do
      season = create(:season)
      c1, c2, c3, c4, c5, c6 = create_list(:contestant, 6, season: season)
      league_1, league_2 = create_list(:league, 2, season: season)
      team_1, team_2, team_3, team_4, team_5 = create_list(:team, 5)
      league_1.teams << [team_1, team_2]
      league_2.teams << [team_3, team_4, team_5]

      [c1, c2, c3, c4, c5, c6].each_with_index do |c, i|
        DraftPick.create(contestant: c, rank: i, team: team_1)
      end

      [c1, c3, c4, c5, c2, c6].each_with_index do |c, i|
        DraftPick.create(contestant: c, rank: i, team: team_2)
      end

      [c1, c2, c3, c4, c5, c6].each_with_index do |c, i|
        DraftPick.create(contestant: c, rank: i, team: team_3)
      end

      [c6, c2, c3, c4, c5, c1].each_with_index do |c, i|
        DraftPick.create(contestant: c, rank: i, team: team_4)
      end

      [c1, c3, c2, c4, c6, c5].each_with_index do |c, i|
        DraftPick.create(contestant: c, rank: i, team: team_5)
      end

      TeamContestant.initiate_draft(season)

      expect(team_1.contestants.count).to eq(3)
      expect(team_1.contestants).to contain_exactly(c1, c2, c5)
      expect(team_2.contestants).to contain_exactly(c3, c4, c6)

      expect(team_3.contestants).to contain_exactly(c1, c2)
      expect(team_4.contestants).to contain_exactly(c4, c6)
      expect(team_5.contestants).to contain_exactly(c3, c5)
    end
  end
end
