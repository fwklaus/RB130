# my attempt
def times(n)
  (0...n).each { |num| yield num if block_given? }
  n
end

times(5) do |num|
  puts num
end


# Ruby implementation

# method implementation
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number    # return the original method argument to match behavior of Integer#times
end

# method invocation

times(5) do |num|
  puts num
end

# output:
# 0
# 1
# 2
# 3
# 4
# => 5