require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "relationships" do
    it {should belong_to(:league)}
    it {should have_many(:team_members)}
    it {should have_many(:users)}
    it {should have_many(:team_contestants)}
    it {should have_many(:contestants)}
  end
end
