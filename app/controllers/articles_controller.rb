class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :delete]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article has been updated"
      redirect_to article_path(@article)
    else
      flash.now[:warning] = "Article has not been updated"
      render :edit
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article has been created"
      redirect_to articles_path
    else
      flash.now[:warning] = "Article has not been created"
      render :new
    end
  end

  private
  def article_params
    params.require(:article).permit(:title,:body)
  end

  def set_article
    @article = Article.find_by_id(params[:id])
    redirect_to(articles_path, notice: "can't find article") unless @article.present?
  end
end
