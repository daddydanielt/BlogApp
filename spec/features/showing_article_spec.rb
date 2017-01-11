require 'rails_helper'
include AuthenticationMacros

RSpec.feature "Showing Article" do
  before do
    #@user = User.create(email: "test@test.com", password: "123456")
    #@article1 = Article.create(title: "The 1st article", body: "Body of the 1st article", author: @user)
    @password = "123456"
    @user = Fabricate(:user, password: @password, password_confirmation: @password)
    @other_user = Fabricate(:user, password: @password, password_confirmation: @password)
    @article1 = Fabricate(:article, author: @user)
    @article2 = Article.find_by_id(999);
  end

  scenario "A signed in user(author) could see Edit or Delete links" do
    user_sign_in(@user.email, @password)
    visit "/"
    click_link @article1.title
    expect(page).to have_link("Edit Article")
    expect(page).to have_link("Delete Article")
  end

  scenario "A signed in user who is not the author shouldn't see Edit or Delete links" do
    user_sign_in(@other_user.email, @password)
    visit "/"
    click_link @article1.title
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end

  scenario "A non-signed in user doesn't see Edit or Delete links" do
    visit "/"
    click_link @article1.title
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end

  scenario "show article" do
    #visit article_path(@article1)
    visit "/"
    click_link @article1.title
    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(current_path).to eq(article_path(@article1))
  end

  scenario "can't find article" do
    visit "/articles/999-do-not-exist"
    expect(page).to have_content("can't find article")
    expect(current_path).to eq(articles_path)
  end
end