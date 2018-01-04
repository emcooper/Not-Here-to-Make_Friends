require 'rails_helper'

RSpec.describe Week, type: :model do
  describe "relationships" do
    it {should belong_to(:season)}
    it {should have_many(:actions)}
    it {should have_many(:weekly_contestants)}
    it {should have_many(:contestants)}
  end

  describe "class methods" do
    it ".current_week returns upcoming week if today is monday" do
      week_1 = create(:week, date: "2017-08-21")
      week_2 = create(:week, date: "2017-08-28")

      allow(Date).to receive(:today).and_return Date.new(2017,8,28)

      expect(Week.current_week).to eq(week_2)
    end
    it ".current_week returns prior week if today is saturday" do
      week_1 = create(:week, date: "2017-08-21")
      week_2 = create(:week, date: "2017-08-28")

      allow(Date).to receive(:today).and_return Date.new(2017,8,26)

      expect(Week.current_week).to eq(week_1)
    end
  end

  describe "instance methods" do
    it ".next_week returns the following week of the season" do
      season = create(:season)
      week_3 = create(:week, week_number: 3, season: season)
      week_4 = create(:week, week_number: 4, season: season)
      week_1 = create(:week, week_number: 1, season: season)
      week_2 = create(:week, week_number: 2, season: season)
      week_3a = create(:week, week_number: 3)

      expect(week_1.next_week).to eq(week_2)
      expect(week_2.next_week).to eq(week_3)
      expect(week_3.next_week).to eq(week_4)
    end
  end
end
