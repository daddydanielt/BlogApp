require 'rails_helper'


RSpec.feature "Listing Articles" do
  describe "user not signed in" do
    before do
      user_password = "123456"
      @user = Fabricate(:user, password: user_password, password_confirmation: user_password)
      @article1 = Fabricate(:article, author: @user, title: "The first article", body: "Body of the first article")
      @article2 = Fabricate(:article, author: @user, title: "The second article", body: "Body of the second article")
    end
    scenario "List all articles" do
      visit "/"

      expect(page).to have_content(@article1.title)
      expect(page).to have_content(@article1.body)
      expect(page).to have_link(@article1.title)
      expect(page).to have_content(@article2.title)
      expect(page).to have_content(@article2.body)
      expect(page).to have_link(@article2.title)

      expect(page).not_to have_link("New Article")
    end
  end
end