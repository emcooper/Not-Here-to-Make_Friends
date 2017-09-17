RSpec.feature "Admin clicks on admin dashboard link" do
  scenario "they are redirected to admin dashboard" do
    admin = create(:user, role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit root_path
    click_on "Admin Dashboard"

    expect(current_path).to eq("/admin_dashboard")
    expect(page).to have_content("Admin Dashboard")
  end
end
