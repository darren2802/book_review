class SearchController < ApplicationController
  def index
    book_title = params[:title]

    conn = Faraday.new('http://openlibrary.org')

    response = conn.get('/search.json?') do |req|
      req.params['title'] = book_title
    end

    json = JSON.parse(response.body, symbolize_names: :true)

    best_match = json[:docs].first

    @book = Book.new(best_match)
  end
end
