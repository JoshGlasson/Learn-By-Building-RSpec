class Expect
  attr_accessor :arg1

  def initialize(arg1)
    @arg1 = arg1
  end

  def to(comparison)
    if comparison.compare(true) == arg1
      puts 'Test passes! :)'
    else
      puts 'Test fails! D:'
    end
  end

end

class Equal
  attr_accessor :arg2

  def initialize(arg2)
    @arg2 = arg2
  end

  def compare(arg)
    if arg2 == arg
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


expect(true).to eq true
