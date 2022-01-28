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

  def <<(task)
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
    todos.clone
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
    item_at(idx)
    todos.delete_at(idx)
  end

  def to_s
    # ["---- Today's Todos ----", self.to_a].join("\n")
    <<~OUTPUT
    ---- Today's Todos ----
    #{self.to_a.join("\n")}
    OUTPUT
  end

  def each
    counter = 0

    while counter < todos.size
      yield todos[counter]
      counter += 1
    end
    self
  end

  def select
    new_list = TodoList.new(title)

    each do |el|
      new_list.add(el) if yield(el)
    end
    new_list
  end

  def include?(item)
    todos.include?(item)
  end
end

# list = TodoList.new("Daily List")

# todo1 = Todo.new("Buy Milk")
# todo2 = Todo.new("Clean Room")
# todo3 = Todo.new("Go to gym")

# list.add(todo1)
# list.add(todo2)
# list.add(todo3)

# puts list

# # list.remove_at(2)

# list.each do |todo|
#   puts todo
# end


