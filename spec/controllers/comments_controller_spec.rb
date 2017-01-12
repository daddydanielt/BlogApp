require 'rails_helper'
include AuthenticationMacros

RSpec.describe CommentsController, type: :controller do
  describe "POST #create" do
    before do
      password = "123456"
      @user = Fabricate(:user, password: password, password_confirmation: password)
      @other_user = Fabricate(:user, password: password, password_confirmation: password)
    end


    context "signed-in user" do
      it "can create a comment" do
        article = Fabricate(:article, author: @user)
        stub_user_sign_in(@user)

        the_comment_message = Faker::Lorem.sentence
        post :create, params: {article_id: article, comment: { body: the_comment_message}}

        expect(response).to redirect_to(article_path(article))
        expect(article.comments.last.body).to eq(the_comment_message)
        expect(flash[:success]).to eq("Comment has been created")
      end
    end

     context "non-signed-in user" do
      it "can not create a comment" do
        article = Fabricate(:article, author: @user)

        the_comment_message = Faker::Lorem.sentence
        post :create, params: {article_id: article, comment: { body: the_comment_message}}

        expect(response).to redirect_to(new_user_session_path)
        expect(article.comments).to be_empty
      end
    end

  end
end
