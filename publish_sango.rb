require 'mqtt'

MQTT::Client.connect(
  :host     => "lite.mqtt.shiguredo.jp",
  :port     => "1883",
  :username => "yyyyyyyyyyy",
  :password => "xxxxxxxxxxx",
) do |connection|
  connection.publish("TOPIC", "hello world")
end
