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
