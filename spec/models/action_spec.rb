require 'rails_helper'

RSpec.describe Action, type: :model do
  describe "relationships" do
    it {should belong_to(:contestant)}
    it {should belong_to(:play)}
    it {should belong_to(:week)}
  end
end
