require 'json'

class Creates
  include BackToMenu
  def initialize(people = [], book = [], rental = [])
    @people = people
    @book = book
    @rental = rental
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    book_data = { title: book.title, author: book.author }
    puts 'Book Successfully created'
    stored_data = fetch_data('books')
    stored_data.push(book_data)
    update_data('books', stored_data)
    book
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]'
    select_person = gets.chomp.to_i

    case select_person
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'invalid input'
    end
  end

  def create_rental
    puts 'Select a book from the following list by number (not id)'
    list = Lists.new(@people, @book, @rentals)
    list.list_books
    book_index = gets.chomp.to_i
    book = @book[book_index]

    puts 'Select a person from the following list by number (not id)'
    list.list_people
    person_index = gets.chomp.to_i
    person = @people[person_index]
    print 'Date :'
    date_value = gets.chomp
    convert_new_date = DateConverter.new
    date = convert_new_date.convert_date(date_value)

    rental = Rental.new(date, book, person)
    rental_data = { date: date, book_index: book_index, person_index: person_index }
    stored_data = fetch_data('rentals')
    stored_data.push(rental_data)
    update_data('rentals', stored_data)
    puts 'Rental created successfully'
    rental
  end

  private

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N] '
    permission = gets.chomp.downcase == 'y'

    student = Student.new(nil, age, name, permission)
    puts 'Person created successfully'
    person_data = { id: student.id, name: student.name, age: student.age, class_name: student.class }
    stored_data = fetch_data('person')
    stored_data.push(person_data)
    update_data('person', stored_data)
    back_to_menu
    student
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'specialization '
    specialization = gets.chomp.downcase

    teacher = Teacher.new(age, specialization, name)
    puts 'Person created successfully'
    person_data = { id: teacher.id, name: teacher.name, age: teacher.age, class_name: teacher.class }
    stored_data = fetch_data('person')
    stored_data.push(person_data)
    update_data('person', stored_data)
    back_to_menu
    teacher
  end
end
