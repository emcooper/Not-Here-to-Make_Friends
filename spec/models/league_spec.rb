require 'rails_helper'

RSpec.describe League, type: :model do
  describe "relationships" do
    it {should have_many(:teams)}
    it {should belong_to(:season)}
  end
end
