require 'rails_helper'

RSpec.feature "Showing Article" do
  before do
    #@user = User.create(email: "test@test.com", password: "123456")
    @user = Fabricate(:user)

    #@article1 = Article.create(title: "The 1st article", body: "Body of the 1st article", user: @user)
    @article1 = Fabricate(:article, user: @user)


    @article2 = Article.find_by_id(999);
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