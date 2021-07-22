import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:merakiot/src/pages/doctor_calendar.dart';
import 'package:merakiot/src/pages/sensors_page.dart';
import 'package:merakiot/src/utils/shared_preferences.dart';
import 'package:merakiot/src/widgets/boton_seccion.dart';
import 'package:flutter/material.dart';
import 'package:merakiot/src/widgets/headers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_check/animated_check.dart';

const NetworkSecurity STA_DEFAULT_SECURITY = NetworkSecurity.WPA;
const String AP_DEFAULT_SSID = "INFINITUMF89A";
const String AP_DEFAULT_PASSWORD = "0884772702";

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation<double> _animation;
  bool shouldShow= false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));

    _animation = new Tween<double>(begin: 0, end: 10).animate(
        new CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutCirc));
  }
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton( FontAwesomeIcons.wifi, 'Wi-Fi Access',           Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.calendar, 'Agendar Cita',                Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.doorOpen, 'Sensor Log',           Color(0xff66A9F2), Color(0xff536CF6) ),
      //new ItemBoton( FontAwesomeIcons.temperatureLow, 'Themperature', Color(0xffF2D572), Color(0xffE06AA3) ),
      //new ItemBoton( FontAwesomeIcons.tint, 'Humidity',               Color(0xff317183), Color(0xff46997D) ),
    ];

    List<Widget>itemMap = items.map(
            (item)=> FadeInLeft(
            duration: Duration(milliseconds: 250),
            child: BotonSeccion
              (texto: item.texto,
              icon: item.icon,
              color1: item.color1,
              color2: item.color2,
              onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SensorPage()));
                },
            )
            )
    ).toList();
    return Scaffold(
      body: Stack(
          children: <Widget>[
            if(shouldShow)
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: AnimatedCheck(
                          progress: _animation,
                          size: 200,
                        )),
                    ],
                  ),
                )
              ),
            if(!shouldShow)
            Container(
      margin: EdgeInsets.only(top: 200),
      child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
          SizedBox(height: 80),
      ...itemMap
      ],
    ),
    ),
            if(!shouldShow)
            _Encabezado()
          ],
      ),
    );
  }
}

class _Encabezado extends StatefulWidget {
  const _Encabezado({
    Key key,
  }) : super(key: key);

  @override
  _EncabezadoState createState() => _EncabezadoState();
}

class _EncabezadoState extends State<_Encabezado> {
  final prefs = new PreferenciasUsuario();
  String _name;
  String _type;
  String codeDialog;
  String valueText;
  TextEditingController _textFieldController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _name= prefs.nombre;
    _type = prefs.type;
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconHeader(
          subtitulo: 'Welcome to Cisco Meraki Dashboard',
          titulo: _name,
          icon: FontAwesomeIcons.hubspot,
          color1: Color(0xff75c636),
          color2: Color(0xff528b26),
        ),
        Positioned(
          right: 0,
          top: 40,
          child:PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context){
               if (_type == 'Doctor'){
                return {'Logout'}.map((String e) {
                  return PopupMenuItem<String>(child: Text(e),value: e,);}
                ).toList();
              }else{
                return {'logout', 'Upgrade Doctor'}.map((String e) {
                  return PopupMenuItem<String>(child: Text(e),value: e,);}
                ).toList();
              }

            },
            ),
          ),
      ],
    );
  }
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: StadiumBorder(),
            elevation: 24.0,
            backgroundColor: Color(0xff528b26),
            title: Text('Write the email Doctor',style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "email", hintStyle: TextStyle(color: Colors.white)),
            ),
            actions: <Widget>[
              FlatButton(
                shape: CircleBorder(),
                color: Color(0xff75c636),
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),

            ],
          );
        });
  }
  void handleClick(String value) {
    switch (value) {
      case 'logout':
        Navigator.of(context).pop();
        break;
      case 'Upgrade Doctor':
        _displayTextInputDialog(context);
        print('');
        break;
      case 'Upgrade Apikey':
        _displayTextInputDialog(context);
        print('new api key');
    }
  }

}

class BotonSeccionTemp extends StatelessWidget {
  const BotonSeccionTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonSeccion(
      icon: FontAwesomeIcons.carCrash,
      texto: "Accidente de auto",
      color1: Color(0xff6989F5),
      color2: Color(0xff906EF5),
      onPress: (){
        print("lo lograste");
      },
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(titulo: "Nombre", subtitulo: "Bienvenido de Vuelta", icon: FontAwesomeIcons.plusCircle,color1: Color(0xdd526BF6),color2: Color(0xdd67acf2),);
  }
}
