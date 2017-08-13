RSpec.feature "Authenticated user visits their profile page" do
  it "sees links to active leagues only" do
    user = create(:user)
    active_season = create(:season, :active_with_existing_users)
    retired_season = create(:season, :retired_with_existing_users)
    users_active_leagues = active_season.leagues
    users_retired_leagues = retired_season.leagues

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_button(users_active_leagues[0].name)
    expect(page).to have_button(users_active_leagues[1].name)
    expect(page).to_not have_content(users_retired_leagues[0].name)
    expect(page).to_not have_content(users_retired_leagues[1].name)
  end
end
