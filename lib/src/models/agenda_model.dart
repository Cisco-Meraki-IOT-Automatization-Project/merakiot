import 'dart:convert';

class Citas{
  List<Cita> items = new List();
  Citas();
  Citas.fromJsonList(List<dynamic> jsonList){
    if(jsonList==null){
      return;
    }
    for(var item in jsonList){
      final pelicula = new Cita.fromJson(item);
      items.add(pelicula);
    }
  }
}


class Cita {
  Cita({
    this.date,
    this.firstSurname,
    this.index,
    this.motive,
    this.patientName,
    this.secondSurname,
    this.time,
    this.userMail,
  });

  DateTime date;
  String firstSurname;
  String index;
  String motive;
  String patientName;
  String secondSurname;
  String time;
  String userMail;

  factory Cita.fromJson(Map<String, dynamic> json) => Cita(
    date: DateTime.parse(json["date"]),
    firstSurname: json["first_surname"],
    index: json["index"],
    motive: json["motive"],
    patientName: json["patient_name"],
    secondSurname: json["second_surname"],
    time: json["time"],
    userMail: json["user_mail"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "first_surname": firstSurname,
    "index": index,
    "motive": motive,
    "patient_name": patientName,
    "second_surname": secondSurname,
    "time": time,
    "user_mail": userMail,
  };
}