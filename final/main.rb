require 'rubygems'
require 'sinatra/rocketio/linda/client'

linda = Sinatra::RocketIO::Linda::Client.new "http://linda.shokai.org"
ts = linda.tuplespace["abs"]

users = Array["abs", "user2", "user3", "chat", "web"]

linda.io.on :connect do
  puts "connect!!"
  puts linda.io.type

  for user in users
    ts.watch [user] do |tuple|
      ID = tuple[0].gsub(/'/, '')
      msg = tuple[1].gsub(/'/, '')
      out = "["+ID + "]\t" + msg
      puts out
      system "say '#{msg}'"
    end
  end
end

linda.wait do
  line = STDIN.gets.strip
  ts.write [ARGV[0], line] if !line.empty?
end
