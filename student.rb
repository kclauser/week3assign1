require_relative "person"

class Student < Person
  # *args captures all the supplied arguments
  # super just passes all the arguments up the chain
  # in this case, to Person
  # the 'args' is just a note for a developer
  # you could write    def initialize(*)
  def initialize(*args)
    super
  end

  def show
    puts "result is #{self.class.name.downcase}"
    info.each do |key, value|
      puts "#{name}'s #{key} is #{value}"
    end
  end
end
