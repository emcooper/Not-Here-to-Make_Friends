RSpec.feature "Admin initiates the draft" do
  context "before teams have drafted" do
    scenario "all teams' rosters are set" do
      admin = create(:user, role: "admin")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      season = create(:season, drafted: false)
      allow_any_instance_of(ApplicationController).to receive(:current_season).and_return(season)
      contestants = create_list(:contestant, 12, season: season)
      league_1, league_2 = create_list(:league, 2, season: season)
      team_1, team_2, team_3, team_4, team_5 = create_list(:team, 5, :with_draft_picks)
      league_1.teams << [team_1, team_2]
      league_2.teams << [team_3, team_4, team_5]

      expect(team_1.contestants.count).to eq(0)
      expect(team_2.contestants.count).to eq(0)
      expect(team_3.contestants.count).to eq(0)
      expect(team_4.contestants.count).to eq(0)
      expect(team_5.contestants.count).to eq(0)

      visit root_path
      click_on "Draft"
      click_on "Initiate Draft"

      expect(page).to have_content("This season is now drafted.")
      expect(page).to_not have_content("Start Draft")
      expect(team_1.contestants.count).to eq(6)
      expect(team_2.contestants.count).to eq(6)
      expect(team_3.contestants.count).to eq(4)
      expect(team_4.contestants.count).to eq(4)
      expect(team_5.contestants.count).to eq(4)
    end
  end
end
