import 'dart:convert';

class Consultas{
  List<Consulta> items = new List();
  Consultas();
  Consultas.fromJsonList(List<dynamic> jsonList){
    if(jsonList==null){
      return;
    }
    for(var item in jsonList){
      final consulta = new Consulta.fromJson(item);
      items.add(consulta);
    }
  }
}
class Consulta {
  Consulta({
    this.date,
    this.index,
    this.patientEmail,
    this.patientFSurname,
    this.patientName,
    this.patientSSurname,
    this.patientSymptoms,
    this.time,
  });

  DateTime date;
  String index;
  String patientEmail;
  String patientFSurname;
  String patientName;
  String patientSSurname;
  String patientSymptoms;
  String time;

  factory Consulta.fromJson(Map<String, dynamic> json) => Consulta(
    date: DateTime.parse(json["date"]),
    index: json["index"],
    patientEmail: json["patient_email"],
    patientFSurname: json["patient_f_surname"],
    patientName: json["patient_name"],
    patientSSurname: json["patient_s_surname"],
    patientSymptoms: json["patient_symptoms"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "index": index,
    "patient_email": patientEmail,
    "patient_f_surname": patientFSurname,
    "patient_name": patientName,
    "patient_s_surname": patientSSurname,
    "patient_symptoms": patientSymptoms,
    "time": time,
  };
}