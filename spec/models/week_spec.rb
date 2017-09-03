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
end
