require 'mqtt'

MQTT::Client.connect(
  :host     => "lite.mqtt.shiguredo.jp",
  :port     => "1883",
  :username => "yyyyyyyy",
  :password => "xxxxxxxx",
) do |connection|
  connection.get("TOPIC") do |topic, message|
    puts "#{topic}: #{message}"
  end
end
