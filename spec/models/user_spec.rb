require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it {should have_many(:team_members)}
    it {should have_many(:teams)}
  end
  describe 'validations' do
    it {should validate_presence_of(:password)}
    it {should validate_confirmation_of(:password)}
    it {should validate_length_of(:password).is_at_least(8)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:name)}
  end
  describe "instance methods" do
    it "#leagues returns array of user's leagues" do
      user = create(:user)
      active_season = create(:season, :active_with_existing_users)
      retired_season = create(:season, :retired_with_existing_users)

      expected = League.all

      expect(user.leagues.pluck(:id)).to eq(expected.pluck(:id))
    end
    it "#active_leagues returns array of user's active leagues" do
      user = create(:user)
      active_season = create(:season, :active_with_existing_users)
      retired_season = create(:season, :retired_with_existing_users)
      expected = active_season.leagues

      expect(user.active_leagues).to eq(expected)
    end
  end
end
