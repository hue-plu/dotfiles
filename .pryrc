if defined?(RbReadline)
  readline_so = "readline.#{RbConfig::CONFIG['DLEXT']}"
  if $LOAD_PATH.detect { |d| File.exists?("#{d}/#{readline_so}") }
    class Object
      remove_const :Readline
    end
    require readline_so
  end
end

begin
  require 'awesome_print'
rescue LoadError
else
  AwesomePrint.pry!
end
