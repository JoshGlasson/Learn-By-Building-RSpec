
def expect_to_be_equal(arg1, arg2)
  if arg1 == arg2
    return 'Test passes! :)'
  else
    return 'Test fails! D:'
  end
end

puts expect_to_be_equal(true, false)
