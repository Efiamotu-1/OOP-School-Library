class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author, _publisher)
    @title = title
    @author = author
    @publisher = publisher
    @rentals = []
  end

  def rent_book(date, person)
    Rental.new(date, person, self)
  end
end
