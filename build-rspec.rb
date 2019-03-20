class Expect
attr_accessor :arg1

  def initialize(arg1)
    @arg1 = arg1
  end

  def to_equal(arg2)
    if arg1 == arg2
      puts 'Test passes! :)'
    else
      puts 'Test fails! D:'
    end
  end
end

Expect.new(true).to_equal(true)
Expect.new(true).to_equal(false)
