import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAb),
    );
  }
}

class HeaderCuadradoR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70),bottomRight: Radius.circular(70)),
        color: Color(0xff615AAb),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      child: CustomPaint(
        painter: _HeaderDiagonalPainter() ,
      ),
    );
  }
}



class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint ();
    //Propiedades
    lapiz.color=Color(0xff615AAb);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth=5.0;
    final path = new Path();

    //Dibujar con el Path
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      child: CustomPaint(
        painter: _HeaderTriangularPainter() ,
      ),
    );
  }
}



class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint ();
    //Propiedades
    lapiz.color=Color(0xff615AAb);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth=5.0;
    final path = new Path();

    //Dibujar con el Path
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      child: CustomPaint(
        painter: _HeaderPicoPainter() ,
      ),
    );
  }
}



class _HeaderPicoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint ();
    //Propiedades
    lapiz.color=Color(0xff615AAb);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth=5.0;
    final path = new Path();
    //Dibujar con el Path
    path.lineTo(0, size.height*.25);
    path.lineTo(size.width / 2, size.height / 3);
    path.lineTo(size.width, size.height*.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      child: CustomPaint(
        painter: _HeaderCurvoPainter() ,
      ),
    );
  }
}



class _HeaderCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint ();
    //Propiedades
    lapiz.color=Color(0xff615AAb);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth=5.0;
    final path = new Path();
    //Dibujar con el Path
    path.lineTo(0, size.height*.25);
    path.quadraticBezierTo(size.width* 0.5, size.height * 0.4, size.width,size.height *0.25);
    path.lineTo(size.width, 0);


    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
class HeaderWaves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      child: CustomPaint(
        painter: _HeaderWavePainter() ,
      ),
    );
  }
}



class _HeaderWavePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint ();
    //Propiedades
    lapiz.color=Color(0xff615AAb);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth=5.0;
    final path = new Path();
    //Dibujar con el Path
    path.lineTo(0, size.height*.25);
    path.quadraticBezierTo(size.width* 0.25, size.height * 0.3, size.width/2,size.height *0.25);
    path.quadraticBezierTo(size.width* 0.75, size.height * 0.2, size.width,size.height *0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }


}
class HeaderWavesDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      child: CustomPaint(
        painter: _HeaderWaveDownPainter() ,
      ),
    );
  }
}



class _HeaderWaveDownPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint ();
    //Propiedades
    lapiz.color=Color(0xff615AAb);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth=5.0;
    final path = new Path();
    //Dibujar con el Path
    path.moveTo(0, size.height);
    path.lineTo(0, size.height*.75);
    path.quadraticBezierTo(size.width* 0.25, size.height * 0.7, size.width/2,size.height *0.75);
    path.quadraticBezierTo(size.width* 0.75, size.height * 0.8, size.width,size.height *0.75);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
class HeaderWavesGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      child: CustomPaint(
        painter: _HeaderWaveGradientPainter() ,
      ),
    );
  }
}



class _HeaderWaveGradientPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(
        center: Offset(165.0, 55.0),
        radius: 180
    );

    final Gradient gradient = new LinearGradient(colors: [
      Color(0xff6D05E8),
      Color(0xffC012FF),
      Color(0xff6D05FA),
    ]);
    final lapiz = Paint ()..shader = gradient.createShader(rect);
    //Propiedades
    //lapiz.color=Color(0xff615AAb);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth=5.0;
    final path = new Path();
    //Dibujar con el Path
    path.lineTo(0, size.height*.25);
    path.quadraticBezierTo(size.width* 0.25, size.height * 0.3, size.width/2,size.height *0.25);
    path.quadraticBezierTo(size.width* 0.75, size.height * 0.2, size.width,size.height *0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader({
    @required this.icon,
    @required this.titulo,
    @required this.subtitulo,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _IconHeaderBack(color1: this.color1,color2: this.color2,),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(icon, color: Colors.white.withOpacity(.2),size: 250,),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 80,width: double.infinity,),
            Text(subtitulo, style: TextStyle(color: Colors.white,fontSize: 20),),
            SizedBox(height: 20,),
            Text(titulo, style: TextStyle(color: Colors.white,fontSize: 25),),
            SizedBox(height: 20,),
            FaIcon(icon, size: 80, color: Colors.white,)
          ],
        )
      ],
    );
  }
}
class _IconHeaderBack extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBack({Key key, this.color1, this.color2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                this.color1,
                this.color2,
              ])
      ),
    );
  }
}