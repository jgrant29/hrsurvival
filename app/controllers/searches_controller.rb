class SearchesController < ApplicationController
  def index
    @tableofcontent_searches = Tableofcontent.search(params[:query], operator: "or", fields: [:body, :title],  page: params[:page], per_page: 12, highlight: {tag: "<strong>", fields: {body: {fragment_size: 245, number_of_fragments: 3}}}, page: params[:page], per_page: 3)
    @article_searches = Article.search(params[:query], operator: "or", fields: [:body, :title], page: params[:page], per_page: 12, highlight: {tag: "<strong>", fields: {body: {fragment_size: 245, number_of_fragments: 3}}}, page: params[:page], per_page: 3)
    @results = (@tableofcontent_searches && @article_searches)
  end

  def autocomplete
    article = Article.search(params[:term], limit: 2).map(&:title)
    tableofcontent = Tableofcontent.search(params[:term], limit: 2).map(&:title)
    render json: (tableofcontent + article)
  end
end