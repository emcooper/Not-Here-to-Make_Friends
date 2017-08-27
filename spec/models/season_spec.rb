require 'rails_helper'

RSpec.describe Season, type: :model do
  describe "relationships" do
    it {should have_many(:leagues)}
    it {should have_many(:weeks)}
    it {should have_many(:contestants)}
  end
end
