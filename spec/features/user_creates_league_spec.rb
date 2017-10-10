RSpec.feature "User clicks button to create league" do
  it "they can fill out a form and create a league" do
    user = create(:user)
    season = create(:season)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:current_season).and_return(season)

    visit '/'

    click_on "Create a League!"

    fill_in "league_name", with: "Here for the Wrong Reasons"
    fill_in "league_team", with: "Taylor's Emotional Intelligence"
    click_on "Create"


  end
end
