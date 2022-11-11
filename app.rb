require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './menu'
require_relative './creates'
require_relative './lists'

require 'date'

class App
  include BackToMenu
  def initialize
    @people = populate_person
    @book = populate_books
    @rentals = populate_rentals(@people, @books)
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

class DateConverter
  def convert_date(str)
    Date.parse(str)
  end
end
