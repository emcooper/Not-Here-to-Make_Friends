RSpec.feature "User visits individual contestant page" do
  context "during active season" do
    before :each do
      @user   = create(:user)
      @season = create(:season, :with_contestants_and_points)
      @cont_2 = Contestant.second
      @cont_3 = Contestant.third
      @week_1 = Week.first
      @week_2 = Week.first
      @big_play = Play.first

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      allow_any_instance_of(ApplicationController).to receive(:current_week).and_return(@week_2)

      visit root_path
      click_on "This Week"
    end

    it "they see contestant name, picture and basic info" do
      within(".contestant-#{@cont_2.id}") do
        find(".cont-page-btn").click
      end

      expect(page).to have_content(@cont_2.name)
      expect(page).to have_content(@cont_2.age)
      expect(page).to have_content(@cont_2.hometown)
      expect(page).to have_content(@cont_2.occupation)
    end

    it "they see stats for contestant" do
      within(".contestant-#{@cont_3.id}") do
        find(".cont-page-btn").click
      end

      expect(page).to have_content("1st Place")
      expect(page).to have_content("Points this Week")
      expect(page).to have_content("2")
      expect(page).to have_content("Points this Season")
      expect(page).to have_content("52")
      expect(page).to have_content("Highest Scoring Play")
      expect(page).to have_content(@big_play.description)
    end
  end
end
