require "rails_helper"

RSpec.feature "Users signout" do
  before  do
    @user = User.create(email: "test@test.com", password: "123456", password_confirmation: "123456")
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "123456"
    click_button "Log in"
  end

  scenario "successfully signout" do
    visit root_path
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end
