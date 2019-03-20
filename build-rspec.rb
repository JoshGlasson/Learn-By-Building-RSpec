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
      arg1.each do |val|
        if inc == val
          return true
        else
          return false
        end
      end
    elsif arg1.kind_of?(Hash) == true
      arg1.each do |key, val|
        if inc == key || inc == val
          return true
        else
          return false
        end
      end
    else if inc == arg1
        return true
      else
        return false
      end
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


expect({2 => 1}).to includes(3)
