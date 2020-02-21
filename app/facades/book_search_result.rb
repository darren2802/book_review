class BookSearchResult
  def initialize(title)
    @title = title
  end

  def book
    conn_open_lib = Faraday.new('http://openlibrary.org')

    response_open_lib = conn_open_lib.get('/search.json?') do |req|
      req.params['title'] = @title.gsub(' ', '_')
    end

    json_open_lib = JSON.parse(response_open_lib.body, symbolize_names: :true)

    best_match = json_open_lib[:docs].first

    Book.new(best_match, reviews)
  end

  def reviews
    nytimes_search_title = @title.gsub(' ', '+')
    response_nytimes = Faraday.get("https://api.nytimes.com/svc/books/v3/reviews.json?title=#{nytimes_search_title}&api-key=#{ENV['NYTIMES_API_KEY']}")

    json_nytimes = JSON.parse(response_nytimes.body, symbolize_names: :true)

    json_nytimes[:results].map do |result|
      result[:summary]
    end
  end
end
