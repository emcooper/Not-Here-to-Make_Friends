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
end
