require_relative '../base_decorator'
require_relative '../person'

describe BaseDecorator do
  before :each do
    @person = Person.new(49, 'Rihanna')
    @base_decorator = BaseDecorator.new(@person)
  end

  describe '#new' do
    it 'creates a new base decorator class' do
      @base_decorator.should(be_an_instance_of(BaseDecorator))
    end
  end
end
