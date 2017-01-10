module AuthenticationMacros
  # [for features spec]
    def user_sign_in(email, passowrd)
      visit Rails.application.routes.url_helpers.root_path
      click_link "Sign in"
      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "123456"
      click_button "Log in"
    end
end