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
    item_at(idx).done!
  end

  def mark_undone_at(idx)
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

  def each
    counter = 0

    while counter < todos.size
      yield todos[counter]
      counter += 1
    end
  end
end


# TodoList#each 
# takes a block
# yields each todo object to the block


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo                   # calls Todo#to_s
end


# The above should send each of the 3 Todo objects to puts, which will automatically invoke the Todo#to_s method. The output should be:

# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym