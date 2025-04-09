class ArticlesController < ApplicationController
    def index
      if params[:query].present?
        query = params[:query].downcase
        articles = Article.where("LOWER(title) LIKE ?", "%#{query}%")
      else
        articles = Article.all
      end
      render json: articles
    end
end