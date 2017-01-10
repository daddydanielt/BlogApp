require "rails_helper"
include AuthenticationMacros

RSpec.feature "Delete Article" do
  before do
    @article1 = Article.create(title: "the 1st article", body: "body of 1st article")
    @article2 = Article.create(title: "the 2nd article", body: "body of 2nd article")

    @user = User.create(email: "test@test.com", password: "123456", password_confirmation: "123456")
    user_sign_in(@user.email, "123456")

  end

  scenario "A user deletes an article scucessfully" do
    visit "/"
    click_link @article1.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end


end