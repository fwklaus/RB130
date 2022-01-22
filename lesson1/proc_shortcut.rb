# the underlying mechanism at work with the proc shortcut

# (&:to_s) ---> { |n| n.to_s } 


def my_method
  yield(2)
end

# turns the symbol into a Proc, then & turns the Proc into a block
my_method(&:to_s)   
# => "2"



# break the one step into two steps to illustrate what's happening
def my_method
  yield(2)
end

a_proc = :to_s.to_proc # explicitly calls the proc on the symbol
my_method(&a_proc) # convert Proc into block, then pass the block in

