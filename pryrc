begin
  require 'awesome_print'
rescue LoadError => err
  puts "no awesome_print :("
end
begin
  if defined?(Pry.commands.alias_command)
    Pry.commands.alias_command 'c', 'continue'
    Pry.commands.alias_command 's', 'step'
    Pry.commands.alias_command 'n', 'next'
    Pry.commands.alias_command 'f', 'finish'
    Pry.commands.alias_command 'wai', 'whereami'
    Pry.commands.alias_command 'btr', 'backtrace'
    Pry.commands.alias_command 'dp', 'disable-pry'
  end
rescue LoadError => err
	puts err
end
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end
