require_relative '../trimmer_decorator'
require_relative '../person'

describe TrimmerDecorator do
  before :each do
    @person = Person.new(49, 'Maximillian')
    @trimmer_decorator = TrimmerDecorator.new(@person)
  end

  describe '#new' do
    it 'creates a new trimmed decorator class' do
      @trimmer_decorator.should(be_an_instance_of(TrimmerDecorator))
    end
  end

  describe 'tests methods in this class' do
    it 'trims the name if the length is greater than 10' do
      expect(@trimmer_decorator.correct_name).to eql 'aximillia'
    end
  end
end
