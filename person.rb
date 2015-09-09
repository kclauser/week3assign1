class Person
  attr_accessor :name,
  :phone,
  :address,
  :github,
  :slack

  def initialize(name, phone, address, github, slack)
    self.name = name
    self.phone = phone
    self.address = address
    self.github = github
    self.slack = slack
  end

  def info
    {
      :name => name,
      :phone => phone,
      :address => address,
      :github => github,
      :slack => slack
    }
  end
end
