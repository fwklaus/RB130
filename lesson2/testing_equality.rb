require 'minitest/autorun'

class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other)
    other.is_a?(Car) && name == other.name
  end
end 

# class EqualityTest < Minitest::Test
#   def test_value_equality
#     str1 = "hi there"
#     str2 = "hi there"

#     assert_equal(str1, str2)
#     assert_same(str1, str2)
#   end
# end


# output

=begin
Run options: --seed 30779

# Running:

F

Finished in 0.004534s, 220.5363 runs/s, 441.0727 assertions/s.

  1) Failure:
EqualityTest#test_value_equality [testing_equality.rb:9]:
Expected "hi there" (oid=400) to be the same as "hi there" (oid=420).

1 runs, 2 assertions, 1 failures, 0 errors, 0 skips
=end

class CarTest < MiniTest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
    # assert_same(car1, car2)           # this will fail
  end
end


# output (before implementing `==` for Car class):

=begin

Run options: --seed 33615

# Running:

F

Finished in 0.120088s, 8.3272 runs/s, 8.3272 assertions/s.

  1) Failure:
CarTest#test_value_equality [testing_equality.rb:48]:
No visible difference in the Car#inspect output.
You should look at the implementation of #== on Car or its members.
#<Car:0xXXXXXX @wheels=4, @name="Kim">

1 runs, 1 assertions, 1 failures, 0 errors, 0 skips

=end


# Output (after implementing `==` for Car class):

=begin

Run options: --seed 36246

# Running:

.

Finished in 0.004258s, 234.8520 runs/s, 234.8520 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips

=end