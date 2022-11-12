require_relative '../person'

describe Person do
  before :each do
    @person = Person.new(30, 'Babakolo')
  end

  describe '#new' do
    it 'should be an instance of the classroom class' do
      @person.should(be_an_instance_of(Person))
    end
  end

  describe 'test for methods in person class' do
    it 'should return the correct name' do
      expect(@person.correct_name).to eql 'Babakolo'
    end

    it 'should check if the person is of age or not' do
      expect(@person.can_use_services).to eql true
    end

    it 'should be able to create a rental for  arespective book' do
      book = Book.new('Harry Potter', 'J.K Rowling')
      @person.rent_book('2020/04/05', book)
      expect(@person.rentals.length).to eql 1
    end
  end
end
