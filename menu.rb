require_relative "person"
require_relative "employee"
require_relative "student"

puts "Person Database System Message"

CHOICES = %w(a s d q)
@people = []

def search(user_search_name)
  person = @people.find { |person| person.name.include?(user_search_name) }
  if person == nil
    puts "no name match found"
  else
    if person.is_a?(Student)
      puts "result is a student"
      person.info.each do |key, value|
        puts "#{person.name}'s #{key} is #{value}"
      end
    else
      puts "result is an employee"
      person.info.each do |key, value|
        puts "#{person.name}'s #{key} is #{value}"
      end
    end
  end
end

def delete
  user_delete_name = gets.chomp
  @people.each do |person|
    if user_delete_name == person.name
      @people -= [person]
      puts "Record deleted"
    else
      puts "no match"
    end
  end
end

loop do
  begin
    puts "Please enter A, S, D, Q"
    user_choice = gets.chomp.downcase
  end until CHOICES.include?(user_choice)



  if user_choice == "a"
  puts "is this person a student or employee"
  student_or_employee = gets.chomp
  if student_or_employee == "s"
    puts "Add Method Chosen"
    puts "Enter name to add"
    name = gets.chomp
    puts "enter phone number"
    phone = gets.chomp
    puts "enter address"
    address = gets.chomp
    puts "enter github"
    github = gets.chomp
    puts "enter slack"
    slack = gets.chomp
    person = Student.new(name, phone, address, github, slack)
    @people << person
    elsif student_or_employee == "e"
    puts "Add method chosen"
    puts "Enter name to add"
    name = gets.chomp
    puts "enter phone number"
    phone = gets.chomp
    puts "enter address"
    address = gets.chomp
    puts "enter github"
    github = gets.chomp
    puts "enter slack"
    slack = gets.chomp
    puts "enter date hired"
    date_hired = gets.chomp
    puts "enter position"
    position = gets.chomp
    puts "enter salary"
    salary = gets.chomp
    person = Employee.new(name, phone, address, github, slack, date_hired, position, salary)
    @people << person
    end


  elsif user_choice == "s"
    puts "Search method chosen"
    puts "Enter name to search"
    user_search_name = gets.chomp
    search(user_search_name)
  elsif user_choice == "d"
    puts "Delete method chosen"
    puts "Enter name to delete"
    delete
  elsif user_choice == "q"
    puts "Quit method chosen"
    break
  end

  p @people
end
