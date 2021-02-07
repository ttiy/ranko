class TopsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @articles = Article.all.order(id: "DESC")
  end
end
