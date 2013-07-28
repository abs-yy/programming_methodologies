# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra/rocketio/linda/client'

linda= Sinatra::RocketIO::Linda::Client.new "http://linda.masuilab.org"
ts = linda.tuplespace["shokai"]

last = 0
linda.io.on :connect do
  puts "connet!!"
  puts linda.io.type

  ts.watch ["sensor", "light"] do |tuple|
    sensor = tuple[2].to_i
    puts sensor
    if last-sensor > 20
      puts "暗くなった"
      system "say 暗くなった"
    elsif sensor-last > 20
      puts "明るくなった"
      system "say 明るくなった"
    end
    last = sensor
  end
end

linda.wait
