require 'hue'

# set up hue client
client = Hue::Client.new

client.lights.each do |light|
  light.set_state({:brightness => 254, :on => true}, 0)
end

# set these variables to whatever you want them to be
rest_time = 0.7
wake_time = 0.1

puts "\n------------------\nRest time: #{rest_time}\nWake time: #{wake_time}\n------------------"

while true
  client.lights.each do |light|
    light.set_state({:on => false}, 0)
    sleep rest_time / client.lights.count
  end

  # randomized attributes
  randhue = rand(Hue::Light::HUE_RANGE)

  puts "\n------------------\nHue: #{randhue}\n------------------"

  client.lights.each do |light|
    light.set_state({:hue => randhue, :on => true}, 0)
    sleep rest_time / client.lights.count
  end
end
