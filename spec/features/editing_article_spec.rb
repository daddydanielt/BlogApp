require 'rails_helper'
include AuthenticationMacros

RSpec.feature "Edit Article" do
  before do
    @password = "123456"
    @user = Fabricate(:user, password: @password, password_confirmation: @password)
    @other_user = Fabricate(:user, password: @password, password_confirmation: @password)
    @article = Fabricate(:article, author: @user, title: "the 1st article", body: "the body of 1st article")
  end

  scenario "A signed in user(author) should update acrticle successfully" do
    user_sign_in(@user.email, @password)
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

  scenario "article fileds validation" do
    user_sign_in(@user.email, @password)
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