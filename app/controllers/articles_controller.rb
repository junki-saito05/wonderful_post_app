class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]
  #before_action :set_article, only: %i[ show edit update destroy ]
  before_action :set_article, only: %i[ edit update destroy ]

  # GET /articles or /articles.json
  def index
    articles = Article.all

    articles = articles.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?

    @articles = articles.page params[:page]
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article, notice: "#{t('activerecord.models.article')}を作成"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    if @article.update(article_params)
      redirect_to @article, notice: "#{t('activerecord.models.article')}を編集"
    else
      render :edit, status: :unprocessable_entity
    end
  end

    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    # 探してきたレコードを削除する
    @article.destroy
    edirect_to articles_url, notice: "#{t('activerecord.models.article')}を削除"

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, tag_ids:[])
    end
end
