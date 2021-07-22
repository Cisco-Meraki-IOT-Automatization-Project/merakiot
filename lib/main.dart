import 'package:flutter/material.dart';
import 'package:merakiot/src/pages/log.dart';
import 'package:flutter/services.dart';
import 'package:merakiot/src/utils/shared_preferences.dart';
import 'dart:async';
import 'package:flutterdoc/flutterdoc.dart';
export 'src/widgets/loginform.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  print(prefs);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meraki IoT',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: LoginPage(),
    );
  }
}
