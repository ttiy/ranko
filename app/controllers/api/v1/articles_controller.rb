class Api::V1::ArticlesController < ApiController
  before_action :set_article, only: [:show]

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    articles = Article.all.order(id: "DESC")
    render json: articles
  end

  def show
    render json: @article
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: article
    else
      render json: article.errors.details, status: :unprocessable_entity
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:body, :emotion, :user_id)
  end
end