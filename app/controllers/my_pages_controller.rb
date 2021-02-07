class MyPagesController < ApplicationController
  def index
    @articles = current_user.articles.order(id: "DESC")
  end
end
