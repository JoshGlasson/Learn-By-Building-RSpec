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

Expect.new(true).to(Equal.new(true))
Expect.new(true).to(Equal.new(false))
