require 'rails_helper'

RSpec.describe WeeklyContestant, type: :model do
  describe "relationships" do
    it {should belong_to(:week)}
    it {should belong_to(:contestant)}
  end
end
