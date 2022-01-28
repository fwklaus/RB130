
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

# assertion/assert-style syntax

class CarTest < MiniTest::Test
  # we extract code here that we can execute before every test
  def setup
    @car = Car.new
  end

  def test_wheels
    # car = Car.new
    assert_equal(4, @car.wheels)
  end

  def test_bad_wheels
    skip("Skip Message: Testing, testing, 1, 2, 3")
    # car = Car.new
    assert_equal(3, @car.wheels)
  end

  def test_car_exists
    # car = Car.new
    assert(@car)
  end
  
  def test_name_is_nil
    # car = Car.new
    assert_nil(@car.name)
  end  

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      Car.new(name: "Joey") # this code raises ArgumentError, so this  assertion passes
    end
  end

  def test_instance_of_car
    # car = Car.new
    assert_instance_of(Car, @car)
  end  

  def test_includes_car
    # car = Car.new
    arr = [1, 2, 3]
    arr << @car
  
    assert_includes(arr, @car)
  end
end

# output when the file is run:

=begin

Run options: --seed 31274

# Running:

.

Finished in 0.003583s, 279.0879 runs/s, 279.0879 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
=end



# after adding the second test and executing the file:

=begin

Run options: --seed 47817

# Running:

F.

Finished in 0.004691s, 426.3120 runs/s, 426.3120 assertions/s.

  1) Failure:
CarTest#test_bad_wheels [car_test.rb:13]:
Expected: 3
  Actual: 4

2 runs, 2 assertions, 1 failures, 0 errors, 0 skips




=begin
# expectation/spec-style syntax

require 'minitest/autorun'

require_relative 'car'

describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new
    _(car.wheels).must_equal 4  # this is the expectation
  end
end


# output(same as the assertion style):
=begin

Run options: --seed 53474

# Running:

.

Finished in 0.005134s, 194.7951 runs/s, 194.7951 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips

=end

