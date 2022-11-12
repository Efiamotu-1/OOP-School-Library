require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './menu'
require 'date'

class App
  def initialize
    @people = []
    @book = []
    @rentals = []
  end

  def run
    puts 'Welcome to school library App!'
    puts ''
    puts ''
    puts 'Please put an option by entering a number!'
    until list_options
      input = gets.chomp
      if input == '7'
        puts 'Thanks for using School Library App (^_^)'
        break
      end
      option(input)
    end
  end

  def list_options
    puts '1 - List all books'
    puts '2 - List all People'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - list all rentals for a given person id'
    puts '7 - Exit'
  end

  def option(input)
    create = Creates.new(@people, @book, @rentals)
    list = Lists.new(@people, @book, @rentals)
    case input
    when '1'
      list.list_books
    when '2'
      list.list_people
    when '3'
      @people.push(create.create_person)
    when '4'
      @book.push(create.create_book)
    when '5'
      @rentals.push(create.create_rental)
    when '6'
      list.list_rentals
    else
      'Enter digit from 1 to 7'
    end
  end
end

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
    puts 'Book Successfully created'
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
    back_to_menu
    teacher
  end
end

class Lists
  include BackToMenu

  def initialize(people = [], book = [], rental = [])
    @people = people
    @book = book
    @rentals = rental
  end

  def list_people
    if @people.empty?
      puts 'No people found!'
      back_to_menu
    end
    @people.each_with_index do |person, i|
      puts "#{i}) [#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def list_books
    if @book.empty?
      puts 'No Book found!'
      back_to_menu
    end

    @book.each_with_index do |text, i|
      puts "#{i}) Title: #{text.title}, Author: #{text.author} "
    end
  end

  def list_rentals
    puts 'Select id of any person'
    @people.each { |i| puts "id: #{i.id}, Person: #{i.name}" }
    print 'Person id: '
    person_id = gets.chomp.to_i
    @rentals.each do |i|
      puts "Date: #{i.date}, Book: '#{i.book.title}' by #{i.book.author}" if i.person.id.to_i == person_id
    end
  end
end

class DateConverter
  def convert_date(str)
    Date.parse(str)
  end
end
