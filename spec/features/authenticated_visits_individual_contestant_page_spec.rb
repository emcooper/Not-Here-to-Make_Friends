RSpec.feature "User visits individual contestant page" do
  context "during active season" do
    it "they see contestant name, picture and basic info" do
      user = create(:user)
      season = create(:season, :with_contestants_and_points)
      cont_1 = Contestant.first
      week_1 = Week.first

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      allow_any_instance_of(ApplicationController).to receive(:current_week).and_return(week_1)

      visit root_path
      click_on "This Week"
      within(".contestant-#{cont_1.id}") do
        find(".cont-page-btn").click
      end

      expect(page).to have_content(cont_1.name)
      expect(page).to have_content(cont_1.age)
      expect(page).to have_content(cont_1.hometown)
      expect(page).to have_content(cont_1.occupation)
    end
  end
end
