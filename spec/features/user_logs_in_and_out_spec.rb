RSpec.feature "User logs in and out" do
  context "with valid credentials" do
    scenario "they are logged in and see profile page" do
      email = "user@gmail.com"
      password = "user123"
      user = create(:user, email: email, password: password)

      visit login_path
      fill_in "session_email", with: email
      fill_in "session_password", with: password
      click_on "Log In"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Hi #{user.name}")

      click_on "Log Out"

      expect(current_path).to eq(login_path)
      expect(page).to_not have_content(user.name)
    end
  end
  context "with invalid password" do
    scenario "they are redirected to login page and shown error message" do
      email = "user@gmail.com"
      password = "user123"
      user = create(:user, email: email, password: password)

      visit login_path
      fill_in "session_email", with: email
      fill_in "session_password", with: "incorrectpassword"
      click_on "Log In"

      expect(current_path).to eq(login_path)
      expect(page).to_not have_content(user.name)
      expect(page).to have_content("Incorrect email or password. Please try again.")
    end
  end
  context "with invalid email" do
    scenario "they are redirected to login page and shown error message" do
      email = "user@gmail.com"
      password = "user123"
      user = create(:user, email: email, password: password)

      visit login_path
      fill_in "session_email", with: "wrongemail"
      fill_in "session_password", with: password
      click_on "Log In"

      expect(current_path).to eq(login_path)
      expect(page).to_not have_content(user.name)
      expect(page).to have_content("Incorrect email or password. Please try again.")
    end
  end
end
