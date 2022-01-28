require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'
# require "pry"
class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  # 0. done!

  def test_done!
    assert_equal(@todo1.done?, todo1.done!)
  end

  # 1. to_a
  
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  # 2. size

  def test_size
    assert_equal(3, @list.size)
    todo4 = Todo.new("Go to school")
    @list << todo4
    assert_equal(4, @list.size)
  end

  # 3. first

  def test_first
    assert_equal(@todo1, @list.first)
  end

  # 4. last

  def test_last
    assert_equal(@todo3, @list.last)
  end

  # 5. shift

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  # 6. pop

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  # 7. done?

  def test_done?
    assert_equal(false, @list.done?)
  end

  # 8. Verifies TypeError when adding items to list that are not Todo objects  # assert_raises

  def test_add_raise_error
    int = 8
    str = "str"
    
    assert_raises(TypeError) do
       @list << int
       @list << str
       @list.add(str)
       @list.add(int)
    end
  end

  # 9. verify that << adds a `Todo` to our `TodoList` # assert_includes

  def test_includes_todo
    new_todo = Todo.new("Go to School")
    @list << new_todo
    
    assert_includes(@list, new_todo)
  end

  # 10

  def test_includes_todo2
    new_todo2 = Todo.new("Make Lunch")
    @list.add(new_todo2)
    
    assert_includes(@list, new_todo2)
  end

  # 11 item_at

  def test_item_at_raise_error
    assert_raises(IndexError) do
       @list.item_at(10) 
       @list.item_at(-5)
    end

    assert_equal(@todo1, @list.item_at(0))
  end

  # 12. mark_done_at

  def test_mark_done_at_raise_error
    assert_raises(IndexError) do
      @list.mark_done_at(10)
    end
  end

  # 13. mark_undone_at

  def test_mark_undone_at_raise_error
    assert_raises(IndexError) do
      @list.mark_undone_at(-10)
      @list.mark_done_at(10)
    end
  end

  # 14. done!  # assert

  def test_done!
    @list.done!
    assert(@list.done?)
  end

  # 15. remove_at

  def test_remove_at_raise_error
    assert_raises(IndexError) do
      @list.remove_at(5)
    end
  end

  # 16. to_s

  def test_to_s
    output = <<~OUTPUT
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  # 17. to_s

  def test_to_s_after_task_complete
    @todo1.done!
    output = <<~OUTPUT
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    
    assert_equal(output, @list.to_s)
  end

  # 18. to_s 

  def test_to_s_all_done
    @list.done!
    output = <<~OUTPUT
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  
  # 19. each

  def test_each_runs
   assert(@list.each {|todo| todo})
  end
  
  # 20. each  

  def test_each_return_value 
    assert_equal(@list, @list.each { |todo| todo})
  end

  # 21. select
  # instance_of

  def test_select_return_value
    assert_instance_of(TodoList, @list.select { |todo| todo})
  end
end

