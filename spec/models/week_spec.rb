require 'rails_helper'

RSpec.describe Week, type: :model do
  describe "relationships" do
    it {should belong_to(:season)}
    it {should have_many(:actions)}
    it {should have_many(:weekly_contestants)}
    it {should have_many(:contestants)}
  end
end
