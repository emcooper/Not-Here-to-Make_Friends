require 'rails_helper'

RSpec.describe ContestantQuality, type: :model do
  describe "relationships" do
    it {should belong_to(:contestant)}
    it {should belong_to(:quality)}
  end
end
