require 'rails_helper'
include AuthenticationMacros

RSpec.feature "Creating Artices" do
  before  do
    @user = User.create(email: "test@test.com", password: "123456", password_confirmation: "123456")
    user_sign_in(@user.email, "123456")
  end

  scenario "A user creates a new article" do
    visit "/"
    click_link "New Article"
    fill_in "Title", with: "Creating the artilce ^_^y"
    fill_in "Body", with: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod "
    click_button "Create Article"

    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
  end

  scenario "A user fails to create a new article" do
    visit "/"
    click_link "New Article"
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button "Create Article"
    expect(page).to have_content("Article has not been created ")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end