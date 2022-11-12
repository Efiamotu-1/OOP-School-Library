require_relative '../capitalize_decorator'
require_relative '../person'

describe CapitalizeDecorator do
  before :each do
    @person = Person.new(49, 'zimmerman')
    @capitalize_decorator = CapitalizeDecorator.new(@person)
  end

  describe '#new' do
    it 'creates a new capitalize decorator class' do
      @capitalize_decorator.should(be_an_instance_of(CapitalizeDecorator))
    end
  end

  describe 'tests methods in this class' do
    it 'capitalizes the first letter of the name' do
      expect(@capitalize_decorator.correct_name).to eql 'Zimmerman'
    end
  end
end
