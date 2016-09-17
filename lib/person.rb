# Define a Person class
class Person
  attr_reader :status

  def initialize
    @status = nil
  end

  # custom setter sets the instance variable and more stuff that just setting
  def status=(new_status)
    @status = new_status

    # Side Effect of changing a Person's status is to say it
    %x{ say "Status changed to #{status}" }
  end

  def log_in
    # we have to use self here otherwise it will only be a local variable and
    # not access the instance
    self.status = 'online'
  end

  def log_out
    # Problem:
    # Will not call the setter method to and notify, or say, that the status
    # has changed!
    # below is an instance variable
    @status = 'offline'
    # proper usage should be self.status = 'offline' bc it's calling an
    # instance method
  end
end
