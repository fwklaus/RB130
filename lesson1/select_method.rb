# Write a select method that mirrors the behavior of Array#select. Note that the Array#select method takes a block, then yields each element to the block. If the block evaluates to true, the current element will be included in the returned array. If the block evaluates to false, the current element will not be included in the returned array.


# select takes a block and an array 
# we iterate over each element of the array
# we yield each element to the block 
# if the block returns true, we select the element for a new array
# return the new array

# define a mehthod with a single block parameter
# define an empty array to store selected elements
# iterate over the array - while
#    yield each element to the block
#      in the block evaluate the paramter - must return boolean
#      - if yield returns true, push the element to the new array
# return the new array


def select(arr)
  new_arr = []
  counter = 0

  if block_given?
    while counter < arr.size
      new_arr.push(arr[counter]) if !!(yield(arr[counter])) == true
      counter += 1
    end
  end

  new_arr
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }
# => [1, 3, 5]


p select(array) { |num| puts num }  
# 1
# 2
# 3
# 4
# 5
# => []

p select(array) { |num| num + 1 }
# => [1, 2, 3, 4, 5]
