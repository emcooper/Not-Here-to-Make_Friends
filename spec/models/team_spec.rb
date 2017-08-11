require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "relationships" do
    it {should belong_to(:league)}
    it {should have_many(:team_members)}
    it {should have_many(:users)}
  end
end
