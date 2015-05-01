require 'mqtt'

MQTT::Client.connect(
  :host     => "test.mosquitto.org",
  :port     => "1883",
) do |connection|
  connection.get("pi") do |topic, message|
    puts "#{topic}: #{message}"

    # LED
    io = open("/sys/class/gpio/export", "w")
    io.write(25)
    io.close

    dir = open("/sys/class/gpio/gpio25/direction", "w")
    dir.write("out")
    dir.close

    out = 1
    10.times do
      v = open("/sys/class/gpio/gpio25/value", "w")
      v.write(out)
      v.close
      out = out == 1 ? 0 : 1
      sleep 0.5
    end

    uexport = open("/sys/class/gpio/unexport", "w")
    uexport.write(25)
    uexport.close

  end
end
