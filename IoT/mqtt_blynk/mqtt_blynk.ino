#define BLYNK_TEMPLATE_ID   "TMPL3BUFU-DEL"
#define BLYNK_TEMPLATE_NAME "mqtt"
#define BLYNK_AUTH_TOKEN    "PCdkJkuh6Kp468JT4obY3g8FOhs2zdPN"

#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include <BlynkSimpleEsp8266.h>

// WiFi
char ssid[] = "A-308";
char pass[] = "dietdu@2024";

// Blynk Auth Token
char auth[] = BLYNK_AUTH_TOKEN;

// HiveMQ Public Broker (test)
const char* mqtt_server = "broker.hivemq.com";
const uint16_t mqtt_port = 1883;
const char* mqtt_client_id = "esp8266-mqtt-blynk"; // make unique
const char* topic_sub = "harmik";
const char* topic_pub = "harmik";

WiFiClient espClient;
PubSubClient mqttClient(espClient);

void mqttCallback(char* topic, byte* payload, unsigned int length) {
  String msg;
  for (unsigned int i = 0; i < length; i++) msg += (char)payload[i];

  Serial.print("MQTT Received ["); 
  Serial.print(topic); 
  Serial.print("] = ");
  Serial.println(msg);

  // Forward to Blynk Virtual Pin V1
  Blynk.virtualWrite(V1, msg);
}

void connectMqtt() {
  while (!mqttClient.connected()) {
    Serial.print("Connecting to MQTT...");
    if (mqttClient.connect(mqtt_client_id)) {
      Serial.println("connected");
      mqttClient.subscribe(topic_sub);
    } else {
      Serial.print("failed, rc=");
      Serial.print(mqttClient.state());
      Serial.println(" retrying in 2s");
      delay(2000);
    }
  }
}

// Blynk button example: publish to MQTT when button on V2 is pressed
BLYNK_WRITE(V2) {
  int val = param.asInt();
  String payload = String(val);
  mqttClient.publish(topic_pub, payload.c_str());
  Serial.print("Published to MQTT: "); 
  Serial.println(payload);
}

void setup() {
  Serial.begin(115200);

  WiFi.begin(ssid, pass);
  Serial.print("Connecting to WiFi");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("\nWiFi connected");

  Blynk.begin(auth, ssid, pass);

  mqttClient.setServer(mqtt_server, mqtt_port);
  mqttClient.setCallback(mqttCallback);
}

void loop() {
  if (!mqttClient.connected()) connectMqtt();
  mqttClient.loop();
  Blynk.run();
}
