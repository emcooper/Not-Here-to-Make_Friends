require 'rails_helper'

RSpec.describe Season, type: :model do
  describe "relationships" do
    it {should have_many(:leagues)}
    it {should have_many(:weeks)}
    it {should have_many(:contestants)}
  end

  describe "instance methods" do
    it "#mvp returns mvp contestant" do
      season = create(:season, :with_contestants_and_points)

      expect(season.mvp).to eq(Contestant.last)
    end
  end
end
