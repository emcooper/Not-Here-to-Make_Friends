require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe "relationships" do
    it {should have_many(:team_contestants)}
    it {should have_many(:teams)}
    it {should belong_to(:season)}
    it {should have_many(:weekly_contestants)}
    it {should have_many(:weeks)}
    it {should have_many(:actions)}
    it {should have_many(:plays)}
    it {should have_many(:draft_picks)}
    it {should have_many(:contestant_qualities)}
    it {should have_many(:qualities)}
  end

  describe "instance methods" do
    it "#season_points returns contestant's total points per season" do
      c1, c2 = create_list(:contestant, 2)
      create(:action, contestant: c1, count: 2)
      create(:action, contestant: c1, count: 1)
      create(:action, contestant: c2, count: 4)

      expect(c1.season_points).to eq(6)
      expect(c2.season_points).to eq(8)
    end

    it "#weekly_actions returns array of contestant's actions for given week" do
      c1, c2 = create_list(:contestant, 2)
      week_1, week_2 = create_list(:week, 2)
      action_1 = create(:action, contestant: c1, count: 2, week: week_1)
      action_2 = create(:action, contestant: c1, count: 1, week: week_1)
      action_3 = create(:action, contestant: c2, count: 4, week: week_1)
      action_4 = create(:action, contestant: c1, count: 3, week: week_2)

      expect(c1.weekly_actions(week_1)).to eq([action_1, action_2])
      expect(c1.weekly_actions(week_2)).to eq([action_4])
      expect(c2.weekly_actions(week_1)).to eq([action_3])
    end

    it "#weekly_points returns contestant's total points per season" do
      c1, c2 = create_list(:contestant, 2)
      week_1, week_2 = create_list(:week, 2)
      create(:action, contestant: c1, week: week_1, count: 2)
      create(:action, contestant: c1, week: week_1, count: 1)
      create(:action, contestant: c1, week: week_2, count: 2)
      create(:action, contestant: c2, week: week_2, count: 1)


      expect(c1.weekly_points(week_1)).to eq(6)
      expect(c1.weekly_points(week_2)).to eq(4)
      expect(c2.weekly_points(week_1)).to eq(0)
      expect(c2.weekly_points(week_2)).to eq(2)
    end

    it "#all_weekly_points returns collection of all weekly points" do
      season = create(:season, :with_contestants_and_points)
      contestant = Contestant.second

      expect(contestant.all_weekly_points.first[:week_number]).to eq(1)
      expect(contestant.all_weekly_points.second[:week_number]).to eq(2)
      expect(contestant.all_weekly_points.first[:points]).to eq(2)
      expect(contestant.all_weekly_points.second[:points]).to eq(2)
      expect(contestant.all_weekly_points.count).to eq(10)
    end

    it "#ranking returns the rank of the contestant" do
      season = create(:season, :with_contestants_and_points)
      contestant_1 = Contestant.first
      contestant_2 = Contestant.second
      contestant_3 = Contestant.third

      expect(contestant_1.ranking).to eq("2nd")
      expect(contestant_2.ranking).to eq("3rd")
      expect(contestant_3.ranking).to eq("1st")
    end

    it "#biggest_play returns the highest scoring play for contestant" do
      season = create(:season, :with_contestants_and_points)
      contestant_2 = Contestant.second
      contestant_3 = Contestant.third
      big_play = Play.first


      expect(contestant_2.biggest_play.point_value).to eq(2)
      expect(contestant_3.biggest_play).to eq(big_play)
    end

    it "#average_draft_rank returns the average draft rank of player" do
      season = create(:season)
      cont_1, cont_2, cont_3 = create_list(:contestant, 3, season: season)

      create(:draft_pick, contestant: cont_1, rank: 2)
      create(:draft_pick, contestant: cont_1, rank: 1)
      create(:draft_pick, contestant: cont_1, rank: 1)
      create(:draft_pick, contestant: cont_2, rank: 1)
      create(:draft_pick, contestant: cont_2, rank: 3)
      create(:draft_pick, contestant: cont_3, rank: 3)

      expect(cont_1.average_draft_rank).to eq("1st")
      expect(cont_2.average_draft_rank).to eq("2nd")
      expect(cont_3.average_draft_rank).to eq("3rd")
    end

    it "#analyze_personality is used as a callback and creates contestant qualities" do
      create_list(:quality, 3)
      contestant = create(:contestant)
      expect(contestant.contestant_qualities.count).to eq(3)
      expect(contestant.contestant_qualities.first.quality.name).to be_a(String)
      expect(contestant.contestant_qualities.first.percentage).to be_a(Float)
    end
  end
end
