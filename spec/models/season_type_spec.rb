require 'rails_helper'

RSpec.describe SeasonType, type: :model do
  describe "relationships" do
    it {should have_many(:seasons)}
    it {should have_many(:plays)}
  end
end
