# The assignment for you is to figure out the rest of the implementation in order for the below code to work. Note that this assignment doesn't have anything to do with blocks yet -- it's just basic Ruby at this point.

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.
require "pry"

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation

  def << (task)
    raise TypeError if task.class != Todo 
    todos << task
    todos
  end

  alias_method :add, :<<

  def size
    todos.size
  end

  def first
    todos[0]
  end

  def last
    todos[-1]
  end

  def to_a
    todos.map do |el|
      "#{el}"
    end
  end

  def done? 
    todos.all? { |item| item.done? }
  end

  def item_at(idx)
    todos.fetch(idx)
  end
  def mark_done_at(idx)
    # todos.fetch(idx)
    # todos[idx].done!
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    # todos.fetch(idx)
    # todos[idx].undone!
    item_at(idx).undone!
  end

  def done!
    todos.each do |item|
      item.done!
    end
  end

  def shift
    todos.shift
  end
  
  def pop
    todos.pop
  end

  def remove_at(idx)
    todos.fetch(idx)
    todos.delete_at(idx)
  end

  def to_s
    puts "---- Today's Todos ----"
    puts self.to_a
  end
end


# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym

# Implement the rest of the TodoList so that we can write this code:


# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")



# ---- Adding to the list -----
# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list

begin
  list.add(1)                     # raises TypeError with message "Can only add Todo objects"
rescue TypeError => e
  "Error message: #{e.message}"
end

# <<
# same behavior as add

# ---- Interrogating the list -----
# size
list.size                      # returns 3

# first
list.first                      # returns todo1, which is the first item in the list

# last
list.last                       # returns todo3, which is the last item in the list

#to_a
list.to_a                       # returns an array of all items in the list

# done?
list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
begin
  list.item_at                    # raises ArgumentError
rescue ArgumentError => e
  "#{e.class}: #{e.message}"
end

list.item_at(1)                 # returns 2nd item in list (zero based index)

begin
  list.item_at(100)               # raises IndexError
rescue IndexError => e
  "#{e.class}: #{e.message}"
end
# ---- Marking items in the list -----

# mark_done_at
begin
  list.mark_done_at               # raises ArgumentError
rescue ArgumentError => e
  "#{e.class}: #{e.message}"
end

list.mark_done_at(1)            # marks the 2nd item as done

begin
  list.mark_done_at(100)          # raises IndexError
rescue IndexError => e
  "#{e.class}: #{e.message}"
end

# mark_undone_at
begin
  list.mark_undone_at             # raises ArgumentError
rescue ArgumentError => e
  "#{e.class}: #{e.message}"
end

list.mark_undone_at(1)          # marks the 2nd item as not done,

begin
  list.mark_undone_at(100)        # raises IndexError
rescue IndexError => e
  "#{e.class}: #{e.message}"
end
# done!
list.done!                      # marks all items as done

# ---- Deleting from the list -----

# shift
# list.shift                      # removes and returns the first item in list

# pop
# list.pop                        # removes and returns the last item in list

# remove_at
# begin
#   list.remove_at                  # raises ArgumentError
# rescue ArgumentError => e
#   "#{e.class}: #{e.message}"
# end

# begin
#   list.remove_at(1)               # removes and returns the 2nd item
# rescue IndexError => e
#   "#{e.class}: #{e.message}"
# end


# begin
#   list.remove_at(100)             # raises IndexError
# rescue IndexError => e
#   "#{e.class}: #{e.message}"
# end

# ---- Outputting the list -----
list. mark_undone_at(0)
list.mark_undone_at(1)
list.mark_undone_at(2)
list.mark_done_at(1)

# to_s
puts list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

=begin
# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym

# Study the requirements above, and try to build the TodoList class.
=end