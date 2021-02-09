class Api::V1::ArticlesController < ApiController
  before_action :set_article, only: [:show]

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    articles = Article.all
    render json: articles
  end

  def show
    render json: @article
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end