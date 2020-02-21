class SearchController < ApplicationController
  def index
    render locals: {
      search_result: BookSearchResult.new(params[:title])
    }
  end
end
