require "rails_helper"

include AuthenticationMacros

RSpec.feature "Adding Comment" do
  before do
    @password = "123456"
    @user = Fabricate(:user, password: @password, password_confirmation: @password)
    @article  = Fabricate(:article, author: @user)
  end

  scenario "A signed-in user can add comment to article" do
    user_sign_in(@user.email, @password)
    visit root_path
    click_link @article.title
    fill_in "New Comment", with: "An awesome article"
    click_button "Create Comment"

    expect(page).to have_content("Comment has been created")
    expect(page).to have_content("An awesome article")
    expect(current_path).to eq(article_path(@article))
  end
end