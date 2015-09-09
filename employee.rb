require_relative "person"

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

  def info
    super.merge({
      :salary => salary,
      :position => position,
      :date_hired => date_hired
      })
  end
end
