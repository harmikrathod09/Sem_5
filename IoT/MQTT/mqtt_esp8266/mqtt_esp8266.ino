/*
  ESP8266 MQTT Two-Way Communication Example
  - ESP8266 connects to WiFi + MQTT broker
  - Publishes serial data to topic "harmik"
  - Subscribes to topic "harmik" and controls built-in LED
*/

#include <ESP8266WiFi.h>
#include <PubSubClient.h>

// WiFi & MQTT Config
const char* ssid = "IoT_Demo";
const char* password = "diet@iot";
const char* mqtt_server = "broker.mqtt-dashboard.com";

// Clients
WiFiClient espClient;
PubSubClient client(espClient);

void setup_wifi() {
  delay(10);
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  randomSeed(micros());

  Serial.println("\nWiFi connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}

// Callback: runs when message arrives from broker
void callback(char* topic, byte* payload, unsigned int length) {
  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.print("] ");

  String message = "";
  for (unsigned int i = 0; i < length; i++) {
    message += (char)payload[i];
  }
  Serial.println(message);

  // LED control
  if (message == "1") {
    digitalWrite(BUILTIN_LED, LOW);   // LED ON
  } else {
    digitalWrite(BUILTIN_LED, HIGH);  // LED OFF
  }
}

// Reconnect if connection drops
void reconnect() {
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    String clientId = "ESP8266Client-";
    clientId += String(random(0xffff), HEX);

    if (client.connect(clientId.c_str())) {
      Serial.println("connected");

      // Subscribe to topic
      client.subscribe("harmik");

      // Optional: Send initial message
      client.publish("8sep", "ESP8266 connected!");
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      delay(5000);
    }
  }
}

void setup() {
  pinMode(BUILTIN_LED, OUTPUT);
  digitalWrite(BUILTIN_LED, HIGH); // LED off at start
  Serial.begin(115200);

  setup_wifi();
  client.setServer(mqtt_server, 1883);
  client.setCallback(callback);
}

void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop();

  // Read from Serial and publish
  if (Serial.available()) {
    String msg = Serial.readStringUntil('\n');
    msg.trim();
    if (msg.length() > 0) {
      client.publish("harmik", msg.c_str());
      Serial.print("Published: ");
      Serial.println(msg);
    }

    if (msg == "1") {
  digitalWrite(BUILTIN_LED, LOW);   // LED ON
} else {
  digitalWrite(BUILTIN_LED, HIGH);  // LED OFF
}
  }
}
