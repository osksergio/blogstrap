class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_paramns)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  private

  def article_paramns
    params.require(:article).permit(:title, :body)
  end
end
