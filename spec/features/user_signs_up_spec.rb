RSpec.feature "User can sign up for account" do
  context "with valid username and password" do
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

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("Your account has been created!")
      expect(page).to have_content("Hi Ellen")
    end
  end
end
