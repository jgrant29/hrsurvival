class SearchesController < ApplicationController
  def index
    @tableofcontent_searches = Tableofcontent.search(params[:query], operator: "or", fields: [:body], page: params[:page], per_page: 12, highlight: {tag: "<strong>", fields: {body: {fragment_size: 245, number_of_fragments: 3}}})
  end

  def autocomplete
    tableofcontent = Tableofcontent.search(params[:term], limit: 5).map(&:title)
    render json: (tableofcontent)
  end
end