import 'dart:math';

import 'package:flutter/material.dart';
class RadialProgress extends StatefulWidget {
  @required final porcentaje;
  final Color colorPrimerio;

  const RadialProgress({ this.porcentaje, this.colorPrimerio = Colors.greenAccent});
  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{
  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);
    final diferecnia = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child){
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress((widget.porcentaje-diferecnia)+(diferecnia * controller.value), widget.colorPrimerio),
          ),
        );
      },
    );
  }
}
class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final colorPrimario;

  _MiRadialProgress(this.porcentaje, this.colorPrimario);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;
    final center = new Offset(size.width / 2, size.height / 2);
    final radio = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radio, paint);


    //arco
    final paintArco = new Paint()
      ..strokeWidth = 4
      ..color = colorPrimario
      ..style = PaintingStyle.stroke;
    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radio), -pi / 2, arcAngle,
        false, paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}