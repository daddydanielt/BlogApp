require 'rails_helper'

RSpec.feature "Creating Artices" do
  scenario "A user creates a new article" do
    visit "/"
    click_link "New Article"
    fill_in "Title", with: "Creating the artilce ^_^y"
    fill_in "Body", with: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod "
    click_button "Create Article"

    expect(page).to have_content("Artice ha been created")
    expect(page.current_path).to eq(articles_path)
  end
end