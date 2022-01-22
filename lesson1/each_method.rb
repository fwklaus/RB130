# my implementation

# method implementation
def each(arr)
  counter = 0
  while counter < arr.size
    yield(arr[counter]) if block_given?
    counter += 1
  end
  arr
end

arr = [1, 2, 3, 4, 5]

# method invocation
each(arr) do |el|
  puts el
end

# 1
# 2
# 3
# 4
# 5
# [1, 2, 3, 4, 5]


# LS implementation

def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end


each([1, 2, 3, 4, 5]) do |num|
  puts num
end

# 1
# 2
# 3
# 4
# 5
# [1, 2, 3, 4, 5]

