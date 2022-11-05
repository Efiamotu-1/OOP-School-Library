class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author, publisher)
    @title = title
    @author = author
    @rentals = []
  end

  def rent_book(date, person)
    Rental.new(date, person, self)
  end
end
