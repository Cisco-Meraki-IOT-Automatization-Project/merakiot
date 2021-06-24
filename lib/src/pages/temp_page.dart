import 'package:flutter/material.dart';
import 'package:merakiot/src/widgets/radial_progress.dart';
import 'package:aws_dynamodb_api/dynamodb-2012-08-10.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class TempPage extends StatelessWidget {
  List<dynamic> stuff;
  Future loadSensors()async{
    print('i got here');
    final resp = await http.get('https://po7yuq5dw8.execute-api.us-east-1.amazonaws.com/Prod/');
    print(resp.body);
  }
  @override
  Widget build(BuildContext context) {
    loadSensors();
    return Scaffold(
      body: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/2,
            width: MediaQuery.of(context).size.width/2,
            child: Stack(
              children: [
                Container(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/2,
                child: RadialProgress(porcentaje: 60.0,colorPrimerio: Colors.yellow,),
                ),
                Center(child: Text('24.4', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width/16),))
              ]
    ),

          ),
          Container(
            height: MediaQuery.of(context).size.height/2,
            width: MediaQuery.of(context).size.width/2,
            child: Stack(
              children: [
                Container(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/2,
                child: RadialProgress(porcentaje: 68.0,colorPrimerio: Colors.greenAccent,),
                ),
                Center(child: Text('68', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width/16),))
              ]
    ),

          ),
      ],
      ),
    );
  }
}
