require 'rails_helper'

RSpec.describe TeamContestant, type: :model do
  describe "relationships" do
    it {should belong_to(:team)}
    it {should belong_to(:contestant)}
  end
end
