require 'rails_helper'

RSpec.describe Action, type: :model do
  describe "relationships" do
    it {should belong_to(:contestant)}
    it {should belong_to(:play)}
    it {should belong_to(:week)}
  end

  describe "instance methods" do
    it "#points returns total points of action" do
      play = create(:play, point_value: 10)
      action_1 = create(:action, count: 3, play: play)
      action_2 = create(:action, count: 5)

      expect(action_1.points).to eq(30)
      expect(action_2.points).to eq(10)
    end
  end
end
