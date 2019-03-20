class Expect
  attr_accessor :arg1

  def initialize(arg1)
    @arg1 = arg1
  end

  def to(comparison)
    if comparison.compare(arg1) == true
      puts 'Test passes! :)'
    else
      puts 'Test fails! D:'
    end
  end
end

class Equal
  attr_accessor :equal

  def initialize(equal)
    @equal = equal
  end

  def compare(arg1)
    if equal == arg1
      return true
    else
      return false
    end
  end
end

class Include
  attr_accessor :inc

  def initialize(inc)
    @inc = inc
  end

  def compare(arg1)
    if arg1.kind_of?(Array) == true
      return arg1.include?(inc)
    elsif arg1.kind_of?(Hash) == true
      arg1.each do |key, val|
        if inc == key || inc == val
          return true
        else
          return false
        end
      end
    elsif inc == arg1
      return true
    elsif arg1.include?(inc)
      return true
    else
      return false
    end
  end
end

class Respond
  attr_accessor :resp

  def initialize(resp)
    @resp = resp
  end

  def compare(arg1)
    if arg1.respond_to?(resp) == true
      return true
    else
      return false
    end
  end
end

class Be
  attr_accessor :be

  def initialize(be)
    @be = be
  end

  def compare(arg1)
    if arg1.kind_of?(Module.const_get(be)) == true
      return true
    else
      return false
    end
  end
end


def expect(value)
  Expect.new(value)
end

def eq(value)
  Equal.new(value)
end

def includes(value)
  Include.new(value)
end

def respond_to(value)
  Respond.new(value)
end

def be_a(value)
  Be.new(value)
end

expect('hello').to includes 'lo'
