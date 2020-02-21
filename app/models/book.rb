class Book
  attr_reader :title, :authors, :genres, :reviews

  def initialize(details, reviews)
    @title = details[:title]
    @authors = details[:author_name]
    @genres = details[:subject]
    @reviews = reviews
  end
end
