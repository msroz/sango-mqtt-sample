require 'mqtt'

MQTT::Client.connect(
  :host     => "test.mosquitto.org",
  :port     => "1883",
) do |connection|
  connection.publish("pi", "hello world")
end
