class Book
  attr_reader :title, :authors, :genres

  def initialize(data)
    @title = data[:title]
    @authors = data[:author_name]
    @genres = data[:subject]
  end
end
