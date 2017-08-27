RSpec.feature "Authenticated user visits their profile page" do
  context "they are part of multiple leagues" do
  it "sees links to active leagues only" do
      user = create(:user)
      active_season = create(:season, :active_with_created_users)
      retired_season = create(:season, :retired_with_created_users)
      users_active_leagues = active_season.leagues
      users_retired_leagues = retired_season.leagues

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      expect(page).to have_link(users_active_leagues[0].name)
      expect(page).to have_link(users_active_leagues[1].name)
      expect(page).to_not have_content(users_retired_leagues[0].name)
      expect(page).to_not have_content(users_retired_leagues[1].name)
    end

    it "sees a table listing team roster contestants only with scores" do
      user = create(:user, :full_setup)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_content(Contestant.first.name)
      find('tr', text: Contestant.first.name).should have_content(1)
      expect(page).to have_content(Contestant.second.name)
      find('tr', text: Contestant.second.name).should have_content(0)
      expect(page).to_not have_content(Contestant.third.name)
      expect(page).to_not have_content(Contestant.fourth.name)

    end
  end
end
