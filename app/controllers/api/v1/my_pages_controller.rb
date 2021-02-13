class Api::V1::MyPagesController < ApiController
  before_action :set_article, only: [:destroy]

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    articles = current_user.articles.order(id: "DESC")
    render json: articles
  end

  def destroy
    if @article.destroy
      render json: @article
    else
      render json: @article.errors.details, status: :unprocessable_entity
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end
