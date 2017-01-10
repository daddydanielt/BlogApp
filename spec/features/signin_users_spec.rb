require "rails_helper"

RSpec.feature "Users sign-in" do
  before  do
    @user = User.create(email: "test@test.com", password: "123456", password_confirmation: "123456")
  end

  scenario "successfully sign" do
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "123456"
    click_button "Log in"
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@user.email}")
  end
end
