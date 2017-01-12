require 'rails_helper'
include AuthenticationMacros

RSpec.describe ArticlesController, type: :controller do

  describe "GET #index" do
    before do
      password = "123456"
      @user = Fabricate(:user, password: password, password_confirmation: password)
      @other_user = Fabricate(:user, password: password, password_confirmation: password)
    end

    context "owner is allowed to edit this articles" do
      it "renders the edit template" do
        article = Fabricate(:article, author: @user)
        stub_user_sign_in(@user)

        get :edit, params: {id: article}
        expect(response).to render_template :edit
        expect(response).to have_http_status(:success)

        put :update, params: {id: article, article: {title: "Updated Title", body: "Updated Body"}}
        expect(response).to redirect_to(article_path(article))
        expect(article.reload.title).to eq("Updated Title")
        expect(article.reload.body).to eq("Updated Body")
        expect(flash[:success]).to eq("Article has been updated")

      end
    end

    context "owner is allowed to delete other users' articles" do
      it "redirect to the root path" do
        article = Fabricate(:article, author: @user)
        stub_user_sign_in(@user)

        delete :destroy, params: {id: article}
        expect(response).to redirect_to(articles_path)
        expect(flash[:success]).to eq("Article has been deleted")
      end
    end


    context "non-owner is not allowed to edit other users' articles" do
      it "redirect to the root path" do
        article = Fabricate(:article, author: @user)
        stub_user_sign_in(@other_user)

        get :edit, params: {id: article}
        expect(response).to redirect_to(root_path)
        expect(flash[:warning]).to eq("Permission denied!")

        put :update, params: {id: article, article: {title: "Updated Title", body: "Updated Body"}}
        expect(response).to redirect_to(root_path)
        expect(flash[:warning]).to eq("Permission denied!")
      end
    end

    context "non-owner is not allowed to delete other users' articles" do
      it "redirect to the root path" do
        article = Fabricate(:article, author: @user)
        stub_user_sign_in(@other_user)

        delete :destroy, params: {id: article}
        expect(response).to redirect_to(root_path)
        expect(flash[:warning]).to eq("Permission denied!")
      end
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
