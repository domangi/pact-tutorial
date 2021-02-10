class ArticlesController < ApplicationController
  def show
    article = Article.find params[:id]

    render json: article.as_json(methods: [:user])
  end
end
