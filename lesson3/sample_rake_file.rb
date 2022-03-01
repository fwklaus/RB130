# three tasks:

# display a message
desc 'say hello'
task :hello do
  puts "Hello there. This is the 'hello' task."
end

# display a message
desc 'Say goodbye'
task :bye do
  puts 'Bye now!'
end

# default task
# Rake runs the default task if you do not provide a specific task name when you invoke Rake
desc 'Do everything'
task :default => [:hello, :bye]



# execute command in terminal to find out what what tasks a Rakefile can run

=begin
$ bundle exec rake -T
rake bye      # Say goodbye
rake default  # Do everything
rake hello    # Say hello


$ bundle exec rake hello
# Hello there. This is the 'hello' task."

=end
