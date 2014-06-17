require "bunny"

conn = Bunny.new
conn.start

ch = conn.create_channel
100.times do
  q = ch.queue("hello")
  ch.default_exchange.publish("Hello World!", :routing_key => q.name)
  puts " [x] Send 'Hello World'"
end

conn.close
