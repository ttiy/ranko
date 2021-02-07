class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to tops_url, notice: I18n.t('messages.created')
    else
      render :new
    end
  end

  def destroy
    article = Article.find(params[:id])
    if article.destroy
      redirect_to my_pages_path, notice: I18n.t('messages.deleted')
    else
      redirect_to my_pages_path, alert: '削除に失敗しました'
    end
  end

  private

  def article_params
    params.require(:article).permit(:body, :emotion)
  end
end
