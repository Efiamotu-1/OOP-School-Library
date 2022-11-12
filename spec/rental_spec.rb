require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  before :each do
    book = Book.new('Game of Thrones', 'George R.R Martin')
    person = Person.new(33, 'Samson')
    @rental = Rental.new('30-05-09', book, person)
  end

  describe '#new' do
    it 'creates a new instance of the rental class' do
      @rental.should(be_an_instance_of(Rental))
    end
  end
end
