import 'dart:convert';

Sensor sensorFromJson(String str) => Sensor.fromJson(json.decode(str));

String sensorToJson(Sensor data) => json.encode(data.toJson());

class Sensor {
  Sensor({
    this.sensorValue,
    this.ts,
  });

  String sensorValue;
  String ts;

  factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
    sensorValue: json["sensorValue"],
    ts: json["ts"],
  );

  Map<String, dynamic> toJson() => {
    "sensorValue": sensorValue,
    "ts": ts,
  };
}