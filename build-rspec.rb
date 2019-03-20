class Expect

  def to_be_equal(arg1, arg2)
    if arg1 == arg2
      return 'Test passes! :)'
    else
      return 'Test fails! D:'
    end
  end
end

puts Expect.new.to_be_equal(true, true)
