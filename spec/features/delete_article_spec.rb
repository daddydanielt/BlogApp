require "rails_helper"
include AuthenticationMacros

RSpec.feature "Delete Article" do
  before do
    @password = "123456"
    @user = Fabricate(:user, password: @password, password_confirmation: @password)
    @other_user = Fabricate(:user, password: @password, password_confirmation: @password)
    @article1 = Fabricate(:article, author: @user, title: "the 1st article", body: "body of 1st article")
    @article2 = Fabricate(:article, author: @user, title: "the 2nd article", body: "body of 2nd article")
  end

  scenario "A signed user(author) deletes an article scucessfully" do
    user_sign_in(@user.email, @password)
    visit "/"
    click_link @article1.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end

  # scenario "A signed user who is not author couldn't delete any articles." do
  #   user_sign_in(@other_user.email, @password)
  #   visit "/"
  #   click_link @article1.title
  #   expect(page).not_to have_link("Delete Article")
  # end


end