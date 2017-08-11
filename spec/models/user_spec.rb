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
end
