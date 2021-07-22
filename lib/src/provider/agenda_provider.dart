 import 'dart:async';
import 'dart:convert';
import 'package:merakiot/src/models/agenda_consulta.dart';
import 'package:merakiot/src/models/agenda_model.dart';
import 'package:http/http.dart' as http;
import 'package:merakiot/src/models/sensors_org_model.dart';

class AgendaProvider {
  final String _url = 'https://po7yuq5dw8.execute-api.us-east-1.amazonaws.com/Prod/';
  List<Cita> _citas = new List();
  final _citasStreamController = StreamController<List<Cita>>.broadcast();
  Function (List<Cita>) get citasSink=> _citasStreamController.sink.add;
  Stream<List<Cita>> get citasStream => _citasStreamController.stream;

  void disposeStreams(){
    _citasStreamController?.close();
  }

  Future<bool> crearCita (Cita evento) async{

  }
  Future<List<Cita>> getDoctor (email) async{
    final url = '$_url/doctor?email=$email';
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    if ( decodedData == null ) return[];

    if ( decodedData['error'] != null ) return [];
    final citas = new Citas.fromJsonList(decodedData['Items']);
    return citas.items;
  }
  Future<List<Consulta>>  getPaciente (email) async{
    final url = '$_url/paciente?email=$email';
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    if ( decodedData == null ) return[];

    if ( decodedData['error'] != null ) return [];
    final consultas = new Consultas.fromJsonList(decodedData['Items']);
    return consultas.items;
  }
 }
 class SensorsProvider{
   final String _url = 'https://po7yuq5dw8.execute-api.us-east-1.amazonaws.com/Prod/sensors';
   Future<List<SensorOrg>> getSensors () async{
     final url = _url;
     final resp = await http.get(url);
     final decodedData = json.decode(resp.body);

     if ( decodedData == null ) return[];
     if ( decodedData['error'] != null ) return [];
     final sensores = new Sensores.fromJsonList(decodedData['Items']);
     print(sensores.items);
     return sensores.items;
   }
 }
 class ProfileProvider{
   final String _url = 'https://po7yuq5dw8.execute-api.us-east-1.amazonaws.com/Prod';
   Future<bool> becomeAdmin(id, apikey) async{
     final url = _url;
     final resp = await http.patch('$url/adminrole?id=$id&apikey=$apikey');
     final decodedData = json.decode(resp.body);
     return true;
   }
   Future<bool> becomeDoctor(id) async{
     final url = _url;
     final resp = await http.post('$url/adminrole?id=$id');
     final decodedData = json.decode(resp.body);
     return true;
   }


 }