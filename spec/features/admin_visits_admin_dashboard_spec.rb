RSpec.feature "Admin clicks on manage seasons link" do
  scenario "they are redirected to admin seasons index" do
    season = create(:season)
    admin = create(:user, role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    allow_any_instance_of(ApplicationController).to receive(:current_season).and_return(season)


    visit root_path
    click_on "Manage Seasons"

    expect(current_path).to eq("/admin/seasons")
  end
end
