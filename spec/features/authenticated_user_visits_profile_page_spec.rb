RSpec.feature "Authenticated user visits their profile page" do
  it "sees links to active leagues only" do
    user = create(:user, :with_2_active_and_2_retired_teams)
  end
end
