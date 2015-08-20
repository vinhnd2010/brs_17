require "rails_helper"

describe User, "sign up" do
  feature "sign up" do
    let!(:user) {FactoryGirl.create :user}

    scenario "Successful sign up" do
      visit "/users/sign_up"
      fill_in "Username", with: "superman"
      fill_in "Email", with: "superman@marvel.com"
      fill_in "Password", with: "123456"
      fill_in "Password confirmation", with: "123456"
      click_button "Sign up"

      expect(page).to have_content "Welcome! You have signed up successfully."
    end

    scenario "Sign up failed with email already exit." do
      visit "users/sign_up"
      fill_in "Username", with: user.name
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password_confirmation
      click_button "Sign up"

      expect(page).to have_content "Email has already been taken"
    end
  end
end
