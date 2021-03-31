import 'package:animate_do/animate_do.dart';
import 'package:merakiot/src/widgets/boton_seccion.dart';
import 'package:flutter/material.dart';
import 'package:merakiot/src/widgets/headers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton( FontAwesomeIcons.wifi, 'Wi-Fi Access',           Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.video, 'Camera',                Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.doorOpen, 'Door log',           Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.temperatureLow, 'Themperature', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.tint, 'Humidity',               Color(0xff317183), Color(0xff46997D) ),
    ];

    List<Widget>itemMap = items.map(
            (item)=> FadeInLeft(
            duration: Duration(milliseconds: 250),
            child: BotonSeccion
              (texto: item.texto,
              icon: item.icon,
              color1: item.color1,
              color2: item.color2,
              onPress: (){print(item.texto);},))
    ).toList();
    return Scaffold(
      body: Stack(
          children: <Widget>[
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
    _Encabezado()
    ],
    ),
    );
  }
}

class _Encabezado extends StatelessWidget {
  const _Encabezado({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconHeader(
          subtitulo: 'Welcome to Cisco Meraki Dashboard',
          titulo: "Nombre Completo",
          icon: FontAwesomeIcons.hubspot,
          color1: Color(0xff75c636),
          color2: Color(0xff528b26),
        ),
        Positioned(
          right: 0,
          top: 40,
          child:RawMaterialButton(child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white,),
            onPressed: () {},
            shape: CircleBorder(),
            padding: EdgeInsets.all(15),
          ),
        )
      ],
    );
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