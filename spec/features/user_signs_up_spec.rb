RSpec.feature "User can sign up for account" do
  context "with valid email and password" do
    it "they are able to sign up and are redirected to profile" do
      name = "Ellen"
      email = "ellen@gmail.com"
      password = "password123"

      visit login_path
      click_on "New User? Create an Account!"
      fill_in "user_name", with: name
      fill_in "user_email", with: email
      fill_in "user_password", with: password
      fill_in "user_password_confirmation", with: password
      click_on "Sign Up!"

      expect(page).to have_content("Your account has been created!")
      expect(page).to have_content("Hi Ellen")
    end
  end
  context "with invalid password" do
    it "they are redirected to sign up page and shown error message" do
      name = "Ellen"
      email = "ellen"
      password = "p"

      visit login_path
      click_on "New User? Create an Account!"
      fill_in "user_name", with: name
      fill_in "user_email", with: email
      fill_in "user_password", with: password
      fill_in "user_password_confirmation", with: password
      click_on "Sign Up!"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Password is too short (minimum is 8 characters)")
      expect(page).to_not have_content("Hi Ellen")
      expect(page).to_not have_content("My Team")
    end
  end
end
