class Person
  attr_accessor :name,
  :phone,
  :address,
  :github,
  :slack
end

class Employee < Person
  attr_accessor :salary,
  :position,
  :date_hired
end

class Student < Person

end

puts "Person Database System Message"

CHOICES = %w(a s d q)
@people = []

def search
  user_search_name = gets.chomp
  @people.each do |person|
    if user_search_name == person.name
      puts "match"
      puts "#{person.name}'s phone is #{person.phone}"
      puts "#{person.name}'s address is #{person.address}"
      puts "#{person.name}'s github is #{person.github}"
      puts "#{person.name}'s slack is #{person.slack}"
      puts "#{person.name}'s position is #{person.position}'"
    else
      puts "no match"

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
    if student_or_employee == "student"
    person = Student.new
    puts "Add method chosen"
    puts "Enter name to add"
    person.name = gets.chomp
    puts "#{person.name} added"
    puts "enter phone number"
    person.phone = gets.chomp
    puts "#{person.name}'s phone is #{person.phone}"
    puts "enter address"
    person.address = gets.chomp
    puts "#{person.name}s address is #{person.address}"
    puts "enter github"
    person.github = gets.chomp
    puts "#{person.name}s github is #{person.github}"
    puts "enter slack"
    person.slack = gets.chomp
    puts "#{person.name}s slack is #{person.slack}"
    @people << person
  elsif student_or_employee == "employee"
    person = Employee.new
    puts "Add method chosen"
    puts "Enter name to add"
    person.name = gets.chomp
    puts "#{person.name} added"
    puts "enter phone number"
    person.phone = gets.chomp
    puts "#{person.name}'s phone is #{person.phone}"
    puts "enter address"
    person.address = gets.chomp
    puts "#{person.name}s address is #{person.address}"
    puts "enter github"
    person.github = gets.chomp
    puts "#{person.name}s github is #{person.github}"
    puts "enter slack"
    person.slack = gets.chomp
    puts "#{person.name}s slack is #{person.slack}"
    puts "enter date hired"
    person.date_hired = gets.chomp
    puts "#{person.name} was hired in #{person.date_hired}"
    puts "enter position"
    person.position = gets.chomp
    puts "#{person.name}s position is a #{person.position}"
    puts "enter salary"
    person.salary = gets.chomp
    puts "#{person.salary}s salary is #{person.salary}"
    @people << person
  end


  elsif user_choice == "s"
    puts "Search method chosen"
    puts "Enter name to search"
    search
  elsif user_choice == "d"
    puts "Delete method chosen"
    puts "Enter name to delete"
    delete
  elsif user_choice == "q"
    puts "Quit method chosen"
    break
  end

  p @people.inspect
end
