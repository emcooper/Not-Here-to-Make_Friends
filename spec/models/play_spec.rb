require 'rails_helper'

RSpec.describe Play, type: :model do
  describe "relationships" do
    it {should belong_to(:season_type)}
  end
end
