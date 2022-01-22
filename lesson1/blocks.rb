# a block
# any bit of code between `do...end` or `{...}`
=begin
[1, 2, 3].each do |num|
  puts num
end

# the block is an argument to the `Array#each` method call


# all methods will accept an optional block as an implicit parameter

def hello
  puts "hello!"
end

# hello("world")  # ArgumentError: wrong number of arguments

hello { puts "world"}  # => hello!
                       # we don't do anything with the implicit block here


# Yield
# by yielding to the block argument we invoke it from within the method
def hello
  yield
  "hello"
end

hello {puts "world!"}  # world!
                       # =>"hello"


# Conditional yield allows us to call a method with or without a block
def hello
  yield if block_given?
  "no blocks given"
end

hello # => "no blocks given"

hello {puts "hello world"} # hello world
# => "no blocks given"

# block with an argument

def hello(num)
  if block_given? 
    yield(num + 1)
  end
end

hello(5) do |num|
  puts num        # outputs 6
end

# => nil - return value comes from `puts` here


# passing the wrong number of arguments to a block

def test
  yield(1, 2)
end

test { |num| p num}

# outputs: 1
# the second argument is ignored


def test
  yield(1)
end

test do |num1, num2|
  puts "#{num1} #{num2}"
end

# outputs: 1
# in this example, num2 is set to nil, so an extra space is interpolated into the string

# blocks have lenient arity
# methods have strict arity


# blocks return a value 

def compare(val)
  puts "Before: #{val}"
  after = yield(val)
  puts "After: #{after}"
end

# The after values are determined by the return value of the block

compare("string") do |arg|
  arg.upcase
end

# Before: string
# After: STRING
# => nil

compare(5) do |arg|
  arg * 10
end

# Before: 5
# After 50
# => nil

compare("string") do |arg|
  "Doing nothing here"
end

# Before: string
# After: Doing nother here
# => nil



# Two main use cases for blocks

# 1) Defer some implementation to method invocation decision

# eg Array#select allows us to pass any expression that evaluates to a boolean in the block parameter



# 2) Methods that need to perform some "before" and "after" actions - sandwich code

def time_it
  time_before = Time.now
  #do something
  time_after = Time.now
  
  puts "It took #{time_after - time_before} seconds."
end

# sandwich code

def time_it
  time_before = Time.now
  yield
  time_after = Time.now
  
  puts "It took #{time_after - time_before} seconds."
end

time_it { sleep(3) }

# It took 3.003932 seconds.
# => nil

time_it { "hello world" }

# It took 6.5e-06 seconds.
# => nil


# sandwich code for Resource Management


my_file = File.open("some_file.txt", "w+") # creates a file with write/read permission
# write to this file using my_file.write
my_file.close # we have to close the file to free up system resources


# the method caller now only needs to pass in the relevant file manipulation code in the block without worrying about closing the file

File.open("some_file.txt", "w+") do |file|
  #write to this file using file.write
end

# we dont need to worry about closing the file
# our sandwich code takes care of that 


# defining an explicit block

def test(&block)
  puts "What's &block? #{block}"
end


test { sleep(1) }

# What's &block? #<Proc:0x00005574f83dcbe8 blocks.rb:188>
# `&block` converts the block argument to a simple `proc` object which we can refer to with the `block` parameter - we drop the `&` when we reference the `proc`


# passing a simple proc around

def test2(block)
  puts "hello"
  block.call
  puts "good-bye"
end

def test(&block)
  puts "1"
  test2(block)
  puts "2"
end

test { |prefix| puts "xyz" }

# 1
# hello
# xyz
# good-bye
# 2


# passing arguments to an explicit block by way of arguments to call

def display(block)
  block.call(">>>")
end

def test(&block)
  puts "1"
  display(block)
  puts "2"
end

test { |prefix| puts prefix + "xyz" }

# 1
# >>>xyz
# 2
=end

# closures retain a memory of their surrounding scope and can use and even update variables in that scope when they are executed

def for_each_in(arr)
  arr.each { |element| yield element }
end

arr = [1, 2, 3, 4, 5]
results = [0]

for_each_in(arr) do |number|
  total = results[-1] + number
  results.push(total)
end

p results
# => [0, 1, 3, 6, 10, 15]


# methods or blocks can return a closure

def sequence
  counter = 0
  Proc.new { counter += 1 }
end

s1 = sequence
p s1.call # => 1
p s1.call # => 2
p s1.call # => 3

s2 = sequence
p s2.call # => 1
p s1.call # => 4
p s2.call # => 2








  














