require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe "relationships" do
    it {should have_many(:team_contestants)}
    it {should have_many(:teams)}
    it {should belong_to(:season)}
    it {should have_many(:weekly_contestants)}
    it {should have_many(:weeks)}
    it {should have_many(:actions)}
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

      expect(contestant.all_weekly_points.first.week_number).to eq(1)
      expect(contestant.all_weekly_points.second.week_number).to eq(2)
      expect(contestant.all_weekly_points.first.points).to eq(2)
      expect(contestant.all_weekly_points.second.points).to eq(2)
      expect(contestant.all_weekly_points.to_a.count).to eq(2)
    end
  end
end
