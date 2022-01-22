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
    todos.fetch(idx)
    todos.delete_at(idx)
  end

  def to_s
    <<~MSG
     ---- Today's Todos ----
    #{self.to_a.join("\n")}
    MSG
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

  def find_by_title(str)
    first_match = nil
    
    each do |todo|
      first_match = str if todo.title == str
    end
    first_match
  end  

  def all_done
    select do |todo|
      todo.done?
    end
  end

  def all_not_done
    select do |todo|
      !todo.done?
    end 
  end

  def mark_done(str)
    each do |todo|
      if str == todo.title
        todo.done!
        break
      end
    end
  end

  def mark_all_done
    self.done!
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

list.find_by_title("Buy milk")  # => Buy milk
list.find_by_title("Go to work") # => nil


list.all_done
#<TodoList:0x00005630176ff7f0 @title="Today's Todos", @todos=[#<Todo:0x00005630176fcca8 @title="Buy milk", @description="", @done=true>]>

list.all_not_done
#<TodoList:0x000055d92a596c18 @title="Today's Todos", @todos=[#<Todo:0x000055d92a597438 @title="Clean room", @description="", @done=false>, #<Todo:0x000055d92a5973c0 @title="Go to gym", @description="", @done=false>]>

list
# ---- Today's Todos ----
# [X] Buy milk
# [ ] Clean room
# [ ] Go to gym

list.mark_done("Clean room")
# ---- Today's Todos ----
# [X] Buy milk
# [X] Clean room
# [ ] Go to gym


list.mark_done("Buy milk")
# ---- Today's Todos ----
# [X] Buy milk
# [X] Clean room
# [ ] Go to gym


list.mark_done("Go to gym")
# ---- Today's Todos ----
# [X] Buy milk
# [X] Clean room
# [X] Go to gym


list.mark_all_done
# ---- Today's Todos ----
# [X] Buy milk
# [X] Clean room
# [X] Go to gym


puts list.mark_all_undone
# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym


