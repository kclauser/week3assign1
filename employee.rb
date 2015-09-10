require_relative "person"
require 'date'

class Employee < Person
  attr_accessor :salary,
  :position,
  :date_hired

  def initialize(name, phone, address, github, slack, date_hired, position, salary)
    self.date_hired = date_hired
    self.position = position
    self.salary = salary

    super(name, phone, address, github, slack)
  end

  def show
    puts "result is #{self.class.name.downcase}"
    info.each do |key, value|
    puts "#{name}'s #{key} is #{value}"



    end
  end

  def tenure
    today = Date.today

    parse_date_hired = Date.parse(date_hired)

    puts "#{name} has been employed for #{today.year - parse_date_hired.year} years."
  end


  def info
    super.merge({
      :salary => salary,
      :position => position,
      :date_hired => date_hired
      })
  end

end
