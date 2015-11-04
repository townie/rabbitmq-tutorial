
#!/usr/bin/env ruby
# encoding: utf-8

require "bunny"

conn = Bunny.new
conn.start

ch = conn.create_channel

q= ch.queue('hello')

ch.default_exchange.publish('hello world', :routing_key => q.name)
puts "[x] sent 'hello world'"

conn.close

