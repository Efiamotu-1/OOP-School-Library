require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('Arts', 42, 'Picasso')
  end

  describe '#new' do
    it 'creates a new instance of teacher class' do
      @teacher.should(be_an_instance_of(Teacher))
    end
  end

  describe 'test for methods in person class' do
    it 'should return the correct name' do
      expect(@teacher.correct_name).to eql 'Picasso'
    end

    it 'should check if the person is of age or not' do
      expect(@teacher.can_use_services).to eql true
    end
  end
end
