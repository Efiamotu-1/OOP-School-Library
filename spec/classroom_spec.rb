require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Ruby Class')
  end

  describe '#new' do
    it 'creates a new instance of the classroom' do
      @classroom.should(be_an_instance_of(Classroom))
    end
  end

  describe 'tests methods in classroom class' do
    it 'adds a new student to a class' do
      student = Student.new('Cs class', 19, 'Broja', true)
      @classroom.add_student(student)
      expect(@classroom.students.length).to eql 1
    end
  end
end
