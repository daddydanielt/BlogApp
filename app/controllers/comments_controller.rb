class CommentsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_article

  def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment has been created"
    else
      flash[:warning] = "Comment has not been created"
      flash[:warning] << "<br/> Please <a href='#{new_user_session_path}'>Sign in</a>"
    end
    redirect_to article_path(@article)
  end


  private
  def set_article
    @article = Article.find_by_id(params[:article_id])
    redirect_to(articles_path, notice: "can't find article") unless @article.present?
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
