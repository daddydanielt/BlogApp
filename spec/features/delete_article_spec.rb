require "rails_helper"
include AuthenticationMacros

RSpec.feature "Delete Article" do
  before do
    user_password = "123456"
    @user = Fabricate(:user, password: user_password, password_confirmation: user_password)
    @article1 = Fabricate(:article, user: @user, title: "the 1st article", body: "body of 1st article")
    @article2 = Fabricate(:article, user: @user, title: "the 2nd article", body: "body of 2nd article")
    user_sign_in(@user.email, user_password)
  end

  scenario "A user deletes an article scucessfully" do
    visit "/"
    click_link @article1.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end


end