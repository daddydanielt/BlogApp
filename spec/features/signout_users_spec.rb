require "rails_helper"

RSpec.feature "Users signout" do
  scenario "successfully signout" do
    # before  do
    #   visit root_path
    #   click_link "Sign in"
    # end
    visit root_path
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end
