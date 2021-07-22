import 'dart:convert';

import 'package:merakiot/src/models/sensors_model.dart';

class Sensores{
  List<SensorOrg> items = new List();
  Sensores();
  Sensores.fromJsonList(List<dynamic> jsonList){
    if(jsonList==null){
      return;
    }
    for(var item in jsonList){
      final consulta = new SensorOrg.fromJson(item);
      items.add(consulta);
    }
  }
}

SensorOrg sensorOrgFromJson(String str) => SensorOrg.fromJson(json.decode(str));

String sensorOrgToJson(SensorOrg data) => json.encode(data.toJson());

class SensorOrg {
  SensorOrg({
    this.idSensor,
    this.humidity,
    this.temperature,
    this.door
  });

  String idSensor;
  List<Sensor> humidity;
  List<Sensor> temperature;
  List<Sensor> door;

  factory SensorOrg.fromJson(Map<String, dynamic> json) => SensorOrg(
    idSensor: json["idSensor"],
    humidity: json["humidity"] == null ? null : List<Sensor>.from(json["humidity"].map((x) => Sensor.fromJson(x))),
    temperature: json["temperature"] == null ? null : List<Sensor>.from(json["temperature"].map((x) => Sensor.fromJson(x))),
    door: json["door"] == null ? null : List<Sensor>.from(json["door"].map((x) => Sensor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "idSensor": idSensor,
    "humidity": List<dynamic>.from(humidity.map((x) => x.toJson())),
    "temperature": List<dynamic>.from(temperature.map((x) => x.toJson())),
    "door": List<dynamic>.from(door.map((x) => x.toJson())),
  };
}