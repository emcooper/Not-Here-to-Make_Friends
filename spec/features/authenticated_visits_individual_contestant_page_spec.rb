RSpec.feature "User visits individual contestant page" do
  context "during active season" do
    it "they see contestant name, picture and basic info" do
      user = create(:user)
      season = create(:season, :with_contestants_and_points)
      cont_1 = Contestant.first

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      click_on "This Week"
      find(".cont-page-btn").click

      expect(page).to have_content(cont_1.name)
      expect(page).to have_content(cont_1.age)
      expect(page).to have_content(cont_1.hometown)
      expect(page).to have_content(cont_1.occupation)
    end
  end
end
