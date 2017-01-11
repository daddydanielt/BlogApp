require 'rails_helper'
include AuthenticationMacros

RSpec.feature "Edit Article" do
  before do
    user_password = "123456"
    @user = Fabricate(:user, password: user_password, password_confirmation: user_password)
    @article = Fabricate(:article, user: @user, title: "the 1st article", body: "the body of 1st article")
    user_sign_in(@user.email, user_password)
  end

  scenario "A user update acrticle successfully" do
    visit "/"
    click_link @article.title
    click_link "Edit Article"
    fill_in "Title", with: "modify - the 1st article"
    fill_in "Body", with: "modify - the body of 1st article"
    click_button "Update Article"

    expect(page).to have_content("Article has been updated")
    expect(page).to have_content("modify - the 1st article")
    expect(page).to have_content("modify - the body of 1st article")
    expect(current_path).to eq(article_path(@article))
  end

  scenario "A user fails to update an article" do
    visit "/"
    click_link @article.title
    click_link "Edit Article"
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button "Update Article"

    expect(page).to have_content("Article has not been updated")
    expect(current_path).to eq(article_path(@article))
  end

end