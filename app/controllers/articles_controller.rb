class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , only: [:edit, :destroy, :new]

  def show
  end
    def edit
  end
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
  def create
    @article = current_user.articles.create(article_params)
    if @article.save
      redirect_to @article, notice: 'El artículo se creó correctamente.'
    else
      render :new
    end
  end


  def update
    @article.update(article_params)
    redirect_to @article
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end
  def from_author
    @user = User.find_by(id: params[:user_id])
      if @user.nil?
        flash[:error] = "Usuario no encontrado"
        redirect_to root_path
    end
  end
  private
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :content)

  end
end
