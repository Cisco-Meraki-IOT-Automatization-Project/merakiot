import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonSeccion extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPress;

  const BotonSeccion({Key key,@required this.icon, @required this.texto, this.color1, this.color2, this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _BotonSeccionBackground(
          icon: icon,
          color1: color1,
          color2: color2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            SizedBox(height: 100,width: 20,),
            FaIcon(icon,color: Colors.white,size: 40,),
            SizedBox(width: 20,),
            Expanded(child: Text(texto,style: TextStyle(color: Colors.white),)),
            GestureDetector(
                onTap: onPress,
                child: FaIcon(FontAwesomeIcons.chevronRight,color: Colors.white,)),
            SizedBox(width: 40,)
          ],
        )
      ],
    );
  }
}

class _BotonSeccionBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const _BotonSeccionBackground({Key key, this.color1, this.color2, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(icon,size: 150,color: Colors.white.withOpacity(0.2),),

            ),
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black.withOpacity(0.2),offset: Offset(4,6),blurRadius: 10),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
            colors: <Color>[
              color1,
              color2,
            ]
        ),
      ),
    );
  }
}
