require 'colorize'

class Expect
  attr_accessor :arg1

  def initialize(arg1)
    @arg1 = arg1
  end

  def to(comparison)
    if comparison.compare(arg1) == true
      return 'Test passes!'.green
    else
      return 'Test fails!'.red
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
    begin
      Module.const_get(arg1)
    rescue
      if arg1.kind_of?(Module.const_get(be.capitalize)) == true
        return true
      else
        return false
      end
    else
      if Module.const_get(arg1).kind_of?(Module.const_get(be.capitalize)) == true
        return true
      else
        return false
      end
    end
  end
end

class Includes_Key
  attr_accessor :key

  def initialize(key)
    @key = key
  end

  def compare(arg1)
    if arg1.kind_of?(Hash) == true
      arg1.has_key?(key)
    else
      return false
    end
  end
end

class Includes_Val
  attr_accessor :val

  def initialize(val)
    @val = val
  end

  def compare(arg1)
    if arg1.kind_of?(Hash) == true
      arg1.has_value?(val)
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

def includes_key(value)
  Includes_Key.new(value)
end

def includes_val(value)
  Includes_Val.new(value)
end

def it(test)
  begin
    value = yield
  rescue
    puts "Test '#{test}': Test Error".red
  else
    puts "Test '#{test}': #{value}"
  end
end

#Example Tests

it 'Text contains letter h' do
  expect('hello').to includes 'h'
end

it 'Text contains letter p' do
  expect('hello').to includes 'p'
end

it 'Array includes number 3' do
  expect([1,2,3]).to includes 3
end

it 'Array includes number 7' do
  expect([1,2,3]).to includes 7
end

it 'Hash includes number 1' do
  expect({"one" => 1}).to includes 1
end

it 'Hash includes number 4' do
  expect({"one" => 1}).to includes 4
end

it 'Expect is a class?' do
  expect('Expect').to be_a 'class'
end

it 'It is a class?' do
  expect('It').to be_a 'class'
end

it 'Equals responds to compare' do
  expect(Equal.new(true)).to respond_to :compare
end

it 'Expect responds to compare' do
  expect(Expect.new(true)).to respond_to :compare
end

it 'Numbers are equal: 3 and 3' do
  expect(3).to eq 3
end

it 'Numbers are equal: 7 and 3' do
  expect(7).to eq 3
end

it '[] is an array?' do
  expect([]).to be_a 'Array'
end

it '4 is an array?' do
  expect(4).to be_a 'Array'
end

it 'Hash Key is "one"' do
  expect({"one" => 1}).to includes_key "one"
end

it 'Hash Val is 1' do
  expect({"one" => 1}).to includes_val 1
end
