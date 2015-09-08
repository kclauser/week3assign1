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
people = []

loop do
  begin
    puts "Please enter A, S, D, Q"
    user_choice = gets.chomp.downcase
  end until CHOICES.include?(user_choice)

  if user_choice == "a"
    person = Person.new
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
    people << person.name
  elsif user_choice == "s"
    puts "Search method chosen"
    puts "Enter name to search"
    user_search_name = gets.chomp
    puts people
    if people.include?(user_search_name)
      puts "match"
    else
      puts "no match"
    end


  elsif user_choice == "d"
    puts "Delete method chosen"
  elsif user_choice == "q"
    puts "Quit method chosen"
    break
  end

  p people.inspect
end


# debug stuff
# puts "user_choice is #{user_choice}"
# p add_person_name







# class Book
#   # attr_accessor :title
#
#   def title
#     @title
#   end
#
#   def title=(new_title)
#     @title = new_title
#   end
# end
