require 'rails_helper'

RSpec.describe TeamMember, type: :model do
  describe "relationships" do
    it {should belong_to(:team)}
    it {should belong_to(:user)}
  end
end
