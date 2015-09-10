require_relative "person"
require_relative "employee"
require_relative "student"
require 'date'
class Menu

  CHOICES = %w(a s d q)

  def initialize
    puts "Welcome to the Iron Yard personel manager"
    @people = []
  end

  def record_person(person)
    @people << person
  end

  def prompt(message)
    print "#{message}  : "

    gets.chomp
  end

  def prompt_for_common_attributes(type)
    name    = prompt "Enter the name of the #{type} to add."
    phone   = prompt "Enter the phone number of the #{type}."
    address = prompt "Enter the address of the #{type}."

    return [name, phone, address]
  end

  def add_student
    name, phone, address = prompt_for_common_attributes("student")

    github = prompt "Enter the github account of the student."
    slack  = prompt "Enter the slack account of the student."

    return Student.new(name, phone, address, github, slack)
  end

  def add_employee
    name, phone, address = prompt_for_common_attributes("employee")

    github     = prompt("Enter the github account of the employee.")
    slack      = prompt("Enter the slack account of the employee.")
    date_hired = prompt("Enter the hire date of the employee.")
    position   = prompt("Enter the position of the employee.")
    salary     = prompt("Enter the salary of the employee.")

    return Employee.new(name, phone, address, github, slack, date_hired, position, salary)
  end

  def add
    student_or_employee = prompt "Press 's' to add a student or 'e' to add an employee."

    if student_or_employee == "s"
      person = add_student

      record_person(person)
    elsif student_or_employee == "e"
      person = add_employee

      record_person(person)
    end
  end


  def search(user_search_name)
    person = @people.find { |person| person.name.include?(user_search_name) }
    if person == nil
      puts "That name does not exist in the system."
    else
      person.show
      if person.is_a?(Employee)
        person.tenure
      end
    end
  end

  def delete(user_search_name)
    person = @people.find { |person| person.name.include?(user_search_name)}
    @people.delete(person)
  end

  def display
    loop do
      begin
        user_choice = prompt("Would you like to add someone, search for someone, delete someone, or quit? Please enter A, S, D, or Q.").downcase
      end until CHOICES.include?(user_choice)



      if user_choice == "a"
        add
      elsif user_choice == "s"
        user_search_name = prompt "Enter a name to search."
        search(user_search_name)
      elsif user_choice == "d"
        user_search_name = prompt "Enter a name to delete that record."
        delete(user_search_name)
      elsif user_choice == "q"
        puts "Quit selected, exiting."
        break
      end
    end
  end
end
