RSpec.feature "Authenticated user visits week show page" do
  context "during an active season" do
    scenario "they see current episode number and season" do
      user = create(:user)
      season = create(:season, :with_contestants_and_points)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      click_on "This Week"

      expect(page).to have_content(season.first_name)
      expect(page).to have_content(Week.last.week_number)
    end

    scenario "they see the active contestants only with weekly points" do
      user = create(:user)
      season = create(:season, :with_contestants_and_points)
      week_2 = Week.second
      contestant_2 = Contestant.second

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      allow_any_instance_of(ApplicationController).to receive(:current_week).and_return(week_2)

      visit root_path
      click_on "This Week"

      expect(page).to have_content(contestant_2.name)
      expect(page).to have_content("Points this week: 2")
    end

    scenario "they see a list of actions for each contestant" do

    end
  end
end
