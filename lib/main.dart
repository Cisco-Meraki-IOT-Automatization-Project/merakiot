import 'package:flutter/material.dart';
import 'package:merakiot/src/pages/dashboard.dart';
import 'package:merakiot/src/pages/doctor_calendar.dart';
import 'package:merakiot/src/pages/log.dart';
import 'package:flutter/services.dart';
import 'package:merakiot/src/pages/temp_page.dart';
import 'package:merakiot/src/utils/shared_preferences.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
