module AuthenticationMacros
  # [for features spec]
  def user_sign_in(email, password)
    visit Rails.application.routes.url_helpers.root_path
    click_link "Sign in"
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log in"
  end

  # [for controller spec]
  def stub_user_sign_in(user)
    allow(request.env['warden']).to receive(:authenticate!) { user }
    # specify a return value using `:expect` syntax
    allow(controller).to receive(:current_user) { user }
  end

end