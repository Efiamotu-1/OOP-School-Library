require_relative '../student'
require_relative '../classroom'

describe Student do
  before :each do
    @student = Student.new('Class 1', 20, 'Sharon', true)
  end
  describe '#new' do
    it 'should be an instance of the student class' do
      @student.should(be_an_instance_of(Student))
    end
  end

  describe 'tests for student methods' do
    it 'should return the correct name' do
      expect(@student.correct_name).to eql 'Sharon'
    end

    it 'should check if the person is of age or not' do
      expect(@student.can_use_services).to eql true
    end

    it 'should show that a student plays hookey' do
      expect(@student.play_hooky).to eql '¯(ツ)/¯'
    end

    it 'should put student in a specific class' do
      new_classroom = Classroom.new('CS Class')
      @student.classroom = new_classroom
      expect(@student.classroom).to eq new_classroom
    end
  end
end
