 import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:merakiot/src/models/agenda_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  Future<bool> getPaciente (email) async{
    final url = '$_url/paciente?email=$email';
  }
 }