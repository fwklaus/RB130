# refreher

level_1 = "outer-most variable"

[1, 2, 3].each do |n|                     # block creates a new scope
  level_2 = "inner variable"

  ['a', 'b', 'c'].each do |n2|            # nested block creates a nested scope
    level_3 = "inner-most variable"

    # all three level_X variables are accessible here
  end

  # level_1 is accessible here
  # level_2 is accessible here
  # level_3 is not accessible here

end

# level_1 is accessible here
# level_2 is not accessible here
# level_3 is not accessible here

# closure and binding

def call_me(some_code)
  some_code.call # code will execute the "chunk of coe that gets passed in
end

name = "Robert"
chunk_of_code = Proc.new { puts "hi #{name}" }

call_me(chunk_of_code) # hi Robert
# => nil


# The Proc is aware of the value even though the variable was reassigned after the Proc was defined

def call_me(some_code)
  some_code.call # code will execute the "chunk of coe that gets passed in
end

name = "Robert"
chunk_of_code = Proc.new { puts "hi #{name}" }
name = "Griffin III"

call_me(chunk_of_code) # hi Griffin III
# => nil

# local variables must be defined before a proc for them to be in scope to the closure
# the proc keeps track of its binding, which allows us to seemingly violate local variable scope rules




