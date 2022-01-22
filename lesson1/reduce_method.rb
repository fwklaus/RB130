=begin
input: array
output: integer

explicit:
  - takes an array, optional default value for accumulator
  - takes an implicit block
  - two parameters
      - accumlator and value of current index
  - returns value of accumulator following iteration

implcit:
  - iterate over array

example/test_cases:

[1, 2, 3].reduce do |acc, num|
  acc + num
end

=> 6

Iterations:
    # 1: 0 + 1 -> acc = 1
    # 2: 1 + 2 -> acc = 3
    # 3: 3 + 3 => acc = 6

data/alg:
  - take an array as an argument
  - set optional parameter to accept default argument
  - take a block as an implicit argument
  - create a variable to store the accumulator value 
      - set variable to value of default block parameter
  - create a loop - while
     - yield each element and the value of the accumulator to the block
     - add the values in the block
     - return the sum of the values
     - reassign the value of the accumulator to the return value of the yield
  - return the value of the accumulator
=end

def reduce(arr, def_acc = 0)
  acc = def_acc
  count = 0

  while count < arr.size
    acc = yield(acc, arr[count])
    count += 1
  end
  acc
end

array = [1, 2, 3]

p reduce(array) { |acc, el|  acc + el }
# => 6

p reduce(array, 10) {|acc, el| acc + el}
# => 16


array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }     
# => 15

p reduce(array, 10) { |acc, num| acc + num }    
# => 25

reduce(array) { |acc, num| acc + num if num.odd? }
# NoMethodError: undefined method '+' for nil: NilClass

