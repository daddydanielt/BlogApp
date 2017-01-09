require "rails_helper"

RSpec.feature "Delete Article" do
  before do
    @article1 = Article.create(title: "the 1st article", body: "body of 1st article")
    @article2 = Article.create(title: "the 2nd article", body: "body of 2nd article")
  end

  scenario "A user deletes an article scucessfully" do
    visit "/"
    click_link @article1.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end


end