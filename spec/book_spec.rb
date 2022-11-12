require_relative '../book'
require_relative '../person'

describe Book do
  before :each do
    @book = Book.new('Harry Potter', 'J.K Rowling')
  end

  describe '#new' do
    it 'returns returns a new book' do
      @book.should(be_an_instance_of(Book))
    end

    it 'throws an argument error when parameters are less than or greater than expected' do
      -> { Book.new 'Harry Potter' }.should raise_error ArgumentError
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      @book.title.should eql 'Harry Potter'
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      @book.author.should eql 'J.K Rowling'
    end

    it 'should change the author\'s name' do
      @book.author = 'Dan Brown'
      @book.author.should eql 'Dan Brown'
    end
  end

  describe '#rentals' do
    it 'should create a rental for the respective book' do
      person = Person.new(13, 'Shaun')
      @book.rent_book('2020/04/05', person)
      expect(@book.rentals.length).to eql 1
    end
  end
end
